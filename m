Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3171A31CF2E
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 18:40:42 +0100 (CET)
Received: from localhost ([::1]:57580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC4L1-0003pz-5s
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 12:40:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lC4Gs-00019N-EO
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 12:36:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lC4Gp-0000P7-W5
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 12:36:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613496977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kXnvdG3gTOOkl7LxVxbWwfvWiFdbMy3h8WWH4uixlDI=;
 b=iEF+DZR7Z81vkivwqPnhP8c3ueEQzzE6N90+xoqeyJuv4okfSPfFeqYlqOKiNEhmscwhgn
 /uzFpEkX49yZtSz7nVJPxVR4XLLvCIXRoL7DLKTU/Pdq+kO/zWmsBKiBd9i7kyYoUEHEJu
 PtfMdcyANQJSc00ocvQnmWRCjnqJ52o=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-be52HOpqP0mYrplSW3FmHQ-1; Tue, 16 Feb 2021 12:36:14 -0500
X-MC-Unique: be52HOpqP0mYrplSW3FmHQ-1
Received: by mail-pg1-f200.google.com with SMTP id 33so9674718pgv.0
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 09:36:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kXnvdG3gTOOkl7LxVxbWwfvWiFdbMy3h8WWH4uixlDI=;
 b=Hqnf4o3j0ZoQv9wynFxi1ZjgotXSkhZIKTUEXl4ImFHaIrZDQdZIgcY9Ny+yVWuuH/
 EDeMokv6mm+YVNSITvsHc91QjXqfWYuG/6aGSG6q0wsTQ82BITMDn922xSx4rtqmKiaN
 bD5GO7bfXechnuTZKOn0GVlypG/M6IrevyrzJ+HT1GMYEHh1S5S6bX/Js2xOVicDkc5R
 se2EKoAKttZr7075a6FV+mIXs/DjWtLuUF75T46qFXcmDwYoiTD/Wq/gpCM2g7gAIfk/
 gX6Hn75t+kNs/U5hhVYAMz7TOVOBdrl6yptV4fe5TZ3p6XhXwx6nzIp7bYG6PV6w2VGc
 H7Zg==
X-Gm-Message-State: AOAM530rR00x3PJUbaXkwTSMWYxO1kgmOINZlWHM7LQA691uvRnJz+Eb
 DuuKoTInJj3p27RBvCyCH0fjYjZI5LHwPsflNdoRbfMetW73eXHsRw9S+Kt5dpjweQ2xgIpiSvn
 GaLz5jb8DAOGGVqbnegAms+hxjhhFALY=
X-Received: by 2002:a17:90a:c686:: with SMTP id n6mr5291262pjt.6.1613496973845; 
 Tue, 16 Feb 2021 09:36:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJypxblWRm0J+rRpC4AKYHeEcqDPAA19/qk2Bubi0pGz85bHSNPS2MTodIG4zeVdJNDuiXzHbm5C9inU6MCUKSU=
X-Received: by 2002:a17:90a:c686:: with SMTP id n6mr5291247pjt.6.1613496973607; 
 Tue, 16 Feb 2021 09:36:13 -0800 (PST)
MIME-Version: 1.0
References: <20210216104647.13400-1-cfontana@suse.de>
 <20210216104647.13400-11-cfontana@suse.de>
 <633d0100-73aa-7129-e636-31174140ac62@suse.de>
In-Reply-To: <633d0100-73aa-7129-e636-31174140ac62@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 16 Feb 2021 18:36:02 +0100
Message-ID: <CABgObfYxzZ2h9+z8YnbVOKc6irVirE7JODz92ANJ7XYt2pROTw@mail.gmail.com>
Subject: Re: [RFC v19 10/15] i386: move TCG btp_helper into softmmu/
To: Claudio Fontana <cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> >  {
> >      if (s->flags & HF_IOBPT_MASK) {
> > +#ifdef CONFIG_USER_ONLY
> > +        /* user-mode cpu should not be in IOBPT mode */
> > +        g_assert_not_reached();
> > +#else
> >          TCGv_i32 t_size = tcg_const_i32(1 << ot);
> >          TCGv t_next = tcg_const_tl(s->pc - s->cs_base);
> >
> >          gen_helper_bpt_io(cpu_env, t_port, t_size, t_next);
> >          tcg_temp_free_i32(t_size);
> >          tcg_temp_free(t_next);
> > +#endif /* CONFIG_USER_ONLY */
> >      }
> >  }
>
> Just highlighting this for your convenience Paolo,
> as I am just flailing in the dark here looking for similar patterns.
>
> Is it the case that we should never be in the HF_IOBPT mode when building for CONFIG_USER_ONLY ?

Yes, pretty much. Maybe worth adding a qemu_assert_softmmu() (return
true for softmmu, abort for user-only), like

if ((s->flags & HF_IOBPT_MASK) && qemu_assert_softmmu()) {
}

Slightly weird API, maybe, but something along those lines.

Paolo


