Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA65D2D811A
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 22:29:19 +0100 (CET)
Received: from localhost ([::1]:46908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knpyY-0007fX-90
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 16:29:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1knpwg-0007BK-Bn
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 16:27:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1knpwb-0002Nd-Es
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 16:27:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607722036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2baaQLSNBEeqb8s4I052o+MuhTpKsGsOVMcltvWRcFE=;
 b=aNOyP9+mVucR+xYL6sH7miLPM4QhzsiSGg9Xi+nSnX5Q+Eg773ks3WHh85JgLapAQFN8Iz
 +1tJJM0OmTuP4Dz7ewoPZIWIRSjkWvhV5YvmZk38pddyRZRQN/rh4S5dpmhZRg6lisPom3
 yVv5FhWOmYnt3EzKIgqvK/TEM44hfz8=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-nLhMBtfXPIazlqPOpVUHtQ-1; Fri, 11 Dec 2020 16:27:13 -0500
X-MC-Unique: nLhMBtfXPIazlqPOpVUHtQ-1
Received: by mail-ua1-f71.google.com with SMTP id o5so1941309uad.18
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 13:27:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2baaQLSNBEeqb8s4I052o+MuhTpKsGsOVMcltvWRcFE=;
 b=MJEYBIcLmsGBrDxGtMHopF5eeKaHRQ94XWoRgl9nfucxfA9K6MQnglCIkK/0rd2F55
 C4g7wogFOvtIC03UH43dEUIf995gfYesBeB93uDQ4pCY2FoldSDt7CzSDIrSsvwmM2hv
 T5IppV3P9c84uH6jYyJylB81j9zH5FJ3MLpNXKWjFWBmJrnqm6sr+rWjfjTdfBcVr2Ly
 lc9Dl9wfcVYqROWDTJUWwSbaVwB5TgYxTB0KeZfAoM0gyqX02RMY14HFzg4Qt8C3+Ewi
 1+lndoC9ASdTkPflqTiiwIXSVFIW3LjxvX5aI7XtJBnYq4D2+Z/Gj/lmrRaDMtjT7S/9
 MVhA==
X-Gm-Message-State: AOAM532n+kVP14bXE/6MuO5hFZGuol/i4AwtoS9Lcqv1sgVsjLGwWfCU
 /ijZY04YMuiTR+V4Jb4hDMBuGAMFDZ9BnaPkgI9TNDEzE3HqWbeKaXMTgzZ7vfPXdqZv3PikcpX
 tyMfYzstbPZs/3sMPMO5SVta2m8nahLU=
X-Received: by 2002:a1f:3216:: with SMTP id y22mr16017731vky.1.1607722032624; 
 Fri, 11 Dec 2020 13:27:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzoAxYS7LmWjUd46I3qBH/wmX8+rEnzXAY9WUS8yNPb88aaCCmUw66PGF9HvP9W43g/thyTvGXx+ar4+M0xIEI=
X-Received: by 2002:a1f:3216:: with SMTP id y22mr16017712vky.1.1607722032420; 
 Fri, 11 Dec 2020 13:27:12 -0800 (PST)
MIME-Version: 1.0
References: <20201207131503.3858889-1-philmd@redhat.com>
 <20201207131503.3858889-2-philmd@redhat.com>
In-Reply-To: <20201207131503.3858889-2-philmd@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 11 Dec 2020 18:27:01 -0300
Message-ID: <CAKJDGDYwUdGxHC4ctzqO6JfrsGQDv7uwdCC29x5Ty61=fzV2RA@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] gitlab-ci: Document 'build-tcg-disabled' is a KVM
 X86 job
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Cornelia Huck <cohuck@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 7, 2020 at 10:15 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Document what this job cover (build X86 targets with
> KVM being the single accelerator available).
>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  .gitlab-ci.yml | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: WIllian Rampazzo <willianr@redhat.com>


