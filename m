Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6EF2D24BE
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 08:41:26 +0100 (CET)
Received: from localhost ([::1]:41678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmXcj-0001A2-Gq
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 02:41:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kmXbD-0000NP-8Q
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 02:39:51 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:45146 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kmXbA-00012E-VI
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 02:39:50 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 906064128A;
 Tue,  8 Dec 2020 07:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-transfer-encoding:content-disposition
 :content-type:content-type:mime-version:references:message-id
 :subject:subject:from:from:date:date:received:received:received;
 s=mta-01; t=1607413184; x=1609227585; bh=rsAAEpchu7eNm4NCPQuQvB
 WsCm4kXDvArbPh2XPJJ8Y=; b=q8dMJ7x4P+qV3f+h9bpNYUusagbH8LMFNsqAzm
 t5gS4fYrnf29UDPoKRIVSPiEtxcqIHouHs9//OWp0B6vw+fOx8x+GuqydjGsHaD1
 3IkvTV5FlMlt0usbQF8iFQOmNqbF9lBp+X/bt2EArIiSuCQ7hDAR3v05vUmOuWMr
 dTDAw=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id StcH35Zg_FnI; Tue,  8 Dec 2020 10:39:44 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id A3E6041281;
 Tue,  8 Dec 2020 10:39:44 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 8 Dec
 2020 10:39:44 +0300
Date: Tue, 8 Dec 2020 10:40:16 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH for-6.0] accel: Wire accel to /machine
Message-ID: <X88t4CKMyDfhvdyb@SPB-NB-133.local>
References: <20201207084621.23876-1-r.bolshakov@yadro.com>
 <20201207174419.GP3102898@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201207174419.GP3102898@redhat.com>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 Richard@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 libvir-list@redhat.com,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, Fontana <cfontana@suse.de>, Markus@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 07, 2020 at 05:44:19PM +0000, Daniel P. Berrangé wrote:
> On Mon, Dec 07, 2020 at 11:46:22AM +0300, Roman Bolshakov wrote:
> > An outstanding issue is whether management applications can rely on the
> > value of /machine/accel/type and output of qom-list-types command [2][3]
> > to get current and present accels?
> > 
> > i.e. would it be ok if libvirt assumes that everything up to the first
> > dash in the accel type is the name of the accel (as specified via -M
> > accel=ACCEL flag) when it performs QEMU probing?
> 
> Hmm, I think it is not nice - we shouldn't have to parse the
> accel type names - IMHO typenames should be considered arbitrary
> opaque strings, even if they'll not be expected to change.
> 

Thanks Daniel. I'll then send v2 of ad-hoc QMP/HMP query. By the way, do
we need the HMP query if we get accel in QOM?

Regards,
Roman

