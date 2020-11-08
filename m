Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E28AC2AAA1E
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Nov 2020 09:45:29 +0100 (CET)
Received: from localhost ([::1]:35224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kbgKG-0004GF-FA
	for lists+qemu-devel@lfdr.de; Sun, 08 Nov 2020 03:45:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kbgJN-0003pF-OJ
 for qemu-devel@nongnu.org; Sun, 08 Nov 2020 03:44:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kbgJK-0005cx-Sx
 for qemu-devel@nongnu.org; Sun, 08 Nov 2020 03:44:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604825069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=31mzHOFuDHZzwFDfJClF4Ky8l6bDytYuPZwz08rX56o=;
 b=a8TnA8fH4SEgUInZO/nRAFDMX9yY0adfYKDdPzu2Cyz9PDJ8d/7Prdp43MJcLaDBC2JkL9
 1GUC/gr0ddXJ4G+hQRLH8FIRExWHpZ0ZJU2PRJl1/eFR3Kgm+CtpbBM89Avssh5tTo0Dq5
 +leAB3piaOhLk1EawxAR2L+NwxJiU7Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-kHQnKg7RMa6XOIOEDnMJrQ-1; Sun, 08 Nov 2020 03:44:26 -0500
X-MC-Unique: kHQnKg7RMa6XOIOEDnMJrQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D3C4107AD64;
 Sun,  8 Nov 2020 08:44:25 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-53.ams2.redhat.com [10.36.112.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 171EB277AD;
 Sun,  8 Nov 2020 08:44:20 +0000 (UTC)
Subject: Re: Qemu first time contribution
To: Harshavardhan Unnibhavi <harshavardhan.unnibhavi@gmail.com>,
 qemu-devel@nongnu.org
References: <CA+8xkr4ABLeYam6EPBdMKkX=HB3gik079zxUyo1TF91sCXmoQg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <e84575ae-4eee-ca5a-e4ca-9b1660a8799d@redhat.com>
Date: Sun, 8 Nov 2020 09:44:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CA+8xkr4ABLeYam6EPBdMKkX=HB3gik079zxUyo1TF91sCXmoQg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/08 01:02:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/11/2020 20.18, Harshavardhan Unnibhavi wrote:
> Hi,
> 
> I am looking to contribute code to QEMU, a software I have enjoyed
> using for my own projects. I want to contribute to developing a
> specific component in the project. I was looking for possible project
> ideas and came across this page:
> https://wiki.qemu.org/Google_Summer_of_Code_2020 . Is it ok to start
> working on a project I pick from here? For example I am interested in
> the " TCG Plugin Cache Modelling"  and "NVMe Emulation Performance
> Optimization".
> 
> If not do you maintain a list of components(or issues) that require
> some work or new features to be added?
> 
> Looking forward to your replies.

 Hi,

thanks for your interest in QEMU! However, GSoC 2020 is already over, and
the projects for 2021 haven't been defined yet (as far as I know). But if
you want to have a try with a small task first, we keep a list of rather
small and easy tasks here:

https://wiki.qemu.org/Contribute/BiteSizedTasks

 HTH,
  Thomas


