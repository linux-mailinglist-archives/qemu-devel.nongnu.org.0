Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD3A33AF57
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 10:57:44 +0100 (CET)
Received: from localhost ([::1]:55530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLjyp-0003LF-L2
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 05:57:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLjuP-00080v-4n
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:53:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLjuN-0005NO-7C
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:53:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615801986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2/0Y1Q8R1y5Emuni7pjtYOx0BU5bEkI6x3Npk82dhwA=;
 b=FN+R10fjzSOX12DxksyH+QnmsEcPisi10yUVNu13inPRsIvWL4zrnR+dqED0ACPjL4v6/R
 rfjTtqDf7aQwlzQno+6djMqSxQoIDvnUK8m82rKBJFLZLjeN7Itpk079v+ljJHPkI030b/
 nNu71TQE1DkwwF0IQP4rRRYYSEbAK18=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-HHF511STNuC0f1_iRtzxyQ-1; Mon, 15 Mar 2021 05:53:03 -0400
X-MC-Unique: HHF511STNuC0f1_iRtzxyQ-1
Received: by mail-ot1-f69.google.com with SMTP id q1so19452858ota.20
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 02:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2/0Y1Q8R1y5Emuni7pjtYOx0BU5bEkI6x3Npk82dhwA=;
 b=bYX2rCYr+Dwn/RG+Sj0pCRiYm36Psbd/nAW792yoLSTfZRRjMhzunTaxiJ32aLSjfe
 4xAkcSeU0bTBZx6qKPWljxuJoBeeiHWSOLbqDElKoO6a6bVXl1o7TDbWw25oIwilpqSP
 jP7u66I2JJ7fqNpBO4sshQZ3lPPq0uUdiyRqWB43KpPT+oVRzISsDTbDDBSWEOZCSJSJ
 QLGxIjqCOhFAJnMMG8Opg9g5r0PE+XSj/JjFoEXqUAFCUWK1tp+uJNnr5R83p/m5etQK
 O1b0sF4mcDwFV178luSBItIHrgNIiXxQV6E7QiRTLJNW1tR04/TiihfNqLtdHuhkYgwz
 uGpA==
X-Gm-Message-State: AOAM533nB9GQ24OulblzbekDPbhPJ9oR3Jt+vn5ZSu8rgg4ta/dw4qWW
 sGWdMg+gX762CB6p3nNCkY0Az+aDpWUmDfUzeoUoZwnEPolrFSqI7uE5SxdzaHehVhgXnPbX0fJ
 sKucKQw1JId5jM8r4t1Pfe8nBschzIHA=
X-Received: by 2002:a05:6830:16d3:: with SMTP id
 l19mr10876120otr.79.1615801982407; 
 Mon, 15 Mar 2021 02:53:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYqtf4nolJS2OO3/XsXSl77CjKbZ8ywBb40KIWjmLI/P8v01cG58xXIIWN8ltRTUXDs92IID0AsCB5AMLgA+M=
X-Received: by 2002:a05:6830:16d3:: with SMTP id
 l19mr10876111otr.79.1615801982215; 
 Mon, 15 Mar 2021 02:53:02 -0700 (PDT)
MIME-Version: 1.0
References: <1615529786-30763-1-git-send-email-jasowang@redhat.com>
 <CAFEAcA-fMR8yLC6Y=HSYgpSOrffCYSNnf-0sDQ2RrNWrQff6Ng@mail.gmail.com>
 <113ed7aa-8999-b925-3df3-2a8d7cd2ad84@redhat.com>
 <070ebd11-95e7-93ca-0106-f5a4735fbbd3@redhat.com>
In-Reply-To: <070ebd11-95e7-93ca-0106-f5a4735fbbd3@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Mon, 15 Mar 2021 10:52:51 +0100
Message-ID: <CAP+75-UZ3sydji0OYOv01U6p58Mid3qLy7yzawpow2_7iQ-nSQ@mail.gmail.com>
Subject: Re: [PULL 00/16] Net patches
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 15, 2021 at 9:10 AM Jason Wang <jasowang@redhat.com> wrote:
> =E5=9C=A8 2021/3/15 =E4=B8=8B=E5=8D=881:39, Thomas Huth =E5=86=99=E9=81=
=93:
> > On 14/03/2021 12.37, Peter Maydell wrote:
> >> On Fri, 12 Mar 2021 at 06:16, Jason Wang <jasowang@redhat.com> wrote:
> >>>
> >>> The following changes since commit
> >>> f4abdf32714d1845b7c01ec136dd2b04c2f7db47:
> >>>
> >>>    Merge remote-tracking branch
> >>> 'remotes/stsquad/tags/pull-testing-docs-xen-updates-100321-2' into
> >>> staging (2021-03-11 16:20:58 +0000)
> >>>
> >>> are available in the git repository at:
> >>>
> >>>    https://github.com/jasowang/qemu.git tags/net-pull-request
> >>>
> >>> for you to fetch changes up to
> >>> 9bdb56367679e68e5e71a1c29a1087bda6414b25:
> >>>
> >>>    pvrdma: wean code off pvrdma_ring.h kernel header (2021-03-12
> >>> 14:08:31 +0800)
> >>>
> >>> ----------------------------------------------------------------
> >>>
> >>
> >> Hi; this has a merge conflict in net/nic.c relating to
> >> ID generation: it looks like
> >> "net: unbreak well-form id check for "-nic" (in this pullreq)
> >
> > Uh, I haven't seen that patch on the list, when did you send it?
>
>
> My bad, I thought I sent it but it looks not.
>
>
> >
> > Also what about:
> >
> >  https://patchew.org/QEMU/20210303095910.78277-1-lekiravi@yandex-team.r=
u/
> >
> > ... that has been on the list since quite a while already and should
> > maybe go into v6.0, too?

Another candidate: "Fix stack-buffer-overflow in _eth_get_rss_ex_dst_addr()=
"
https://www.mail-archive.com/qemu-devel@nongnu.org/msg789998.html


