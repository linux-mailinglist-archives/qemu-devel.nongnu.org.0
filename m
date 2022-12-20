Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A25516524AA
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 17:33:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7fVq-0004BJ-Vg; Tue, 20 Dec 2022 11:30:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+3d4d80a81840c180149e+7058+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p7fVd-0004BA-N1
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 11:30:29 -0500
Received: from casper.infradead.org ([90.155.50.34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+3d4d80a81840c180149e+7058+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p7fVV-0004TO-CM
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 11:30:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=nBAbJmz5PWAOWSeqMHvSWohCtQOZ2LpZYIo6jQstgSI=; b=n/wXgBV2MflTM/PnGlyOk8fRkg
 6dbC3ooli8TLwx6iJpc1hHxDgqeEfOK4u619uQip/MPIIwwqXiXIrdOsGt473ojzDmCTVJ/j7a5Jp
 w5LrKqq5xklJ6VKkRFZRXnCnZ7/8V4U9MCoyj2oLLbXf551LORR51uBDgO//vhuUgUqRJoZ/wSdiM
 Amo9MMOk4h8djLU0EaO/wkt6J3fLsysvpRoZ3kyRGc9v8XU0FT234ndspIU0sJlyjvV8iVkN6MXP+
 QiVlGTRc2YLZ9IBoXgersEvYFouKpHbDLrp6TA3JhzrVMSUwblrrJS+xcR/k4tf2VluodpgjYl3bO
 MRSfVE3w==;
Received: from [109.144.17.74] (helo=[127.0.0.1])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p7fSj-001xsq-BE; Tue, 20 Dec 2022 16:27:29 +0000
Date: Tue, 20 Dec 2022 16:27:15 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Paul Durrant <xadimgnik@gmail.com>, qemu-devel@nongnu.org
CC: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>, 
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?ISO-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH_v2_20/22=5D_i386/xen=3A_HV?=
 =?US-ASCII?Q?MOP=5Fset=5Fparam_/_HVM=5FPARAM=5FCALLBACK=5FIRQ?=
User-Agent: K-9 Mail for Android
In-Reply-To: <bec6ab0c-c73e-f5f8-f4a3-e35aa0501e6e@xen.org>
References: <20221209095612.689243-1-dwmw2@infradead.org>
 <20221209095612.689243-21-dwmw2@infradead.org>
 <f4b7feff-c41a-25c6-d098-c4eab9b94eb1@xen.org>
 <9dbe4265d43063348a8fe6ddd2b732615f0631b9.camel@infradead.org>
 <65ccf311-be94-7cf2-6610-360549b547ab@xen.org>
 <eba6ab55c8fa4bf889744287d006a5c085ba8976.camel@infradead.org>
 <bec6ab0c-c73e-f5f8-f4a3-e35aa0501e6e@xen.org>
Message-ID: <B09974FC-9E61-4D7E-BFFF-4B2DB9C09AB4@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=90.155.50.34;
 envelope-from=BATV+3d4d80a81840c180149e+7058+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 20 December 2022 13:56:39 GMT, Paul Durrant <xadimgnik@gmail=2Ecom> wro=
te:
>The callback via is essentially just another line interrupt but its asser=
tion is closely coupled with the vcpu upcall_pending bit=2E Because that is=
 being dealt with in-kernel then the via should be dealt with in-kernel, ri=
ght?

Not right now, because there's not a lot of point in kernel acceleration i=
n the case that it's delivered as GSI=2E There's no per-vCPU delivery, so i=
t doesn't get used for IPI, for timers=2E None of the stuff we want to acce=
lerate in-kernel=2E Only the actual PV drivers=2E

If we do FIFO event channels in the future then the kernel will probably n=
eed to own those; they need spinlocks and you can have *both* userspace and=
 kernel delivering with test-and-set-bit sequences like you can with 2level=
=2E

Even so, I was tempted to add a VFIO-like eventfd pair for the vCPU0 evtch=
n_upcall_pending and let the kernel drive it=2E=2E=2E but qemu doesn't even=
 do the EOI side of that as $DEITY intended, so I didn't=2E

