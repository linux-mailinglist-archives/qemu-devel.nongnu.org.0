Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF8B543B35
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 20:16:07 +0200 (CEST)
Received: from localhost ([::1]:46766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nz0Du-0006a9-D1
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 14:16:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nz0Ck-0005rE-Cs
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 14:14:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nz0Ch-0004Kw-JS
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 14:14:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654712090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eblE6PLI5GJsQn+RUbDAHWjNIRenvJU4Vj8ikWZA3Do=;
 b=ItmwUWS0CAzYkrLCTDtqPJPuSVXs23bjw2MIQ7gU7X4L2Y6QozsgcJn6Z/JBSmH5G5UAgz
 bBFPJrY4ITZ/zVnn7Yjp7FLlrdEH4S+INzuMHx/LETm7g27M2NDqZ2ndx+CQ5quI1qKltB
 Z2tOnO26mXT8YcLbje0SHeB+x5aEa/M=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621--VrS5tDWNEiEgwPX6kg7Og-1; Wed, 08 Jun 2022 14:14:49 -0400
X-MC-Unique: -VrS5tDWNEiEgwPX6kg7Og-1
Received: by mail-ej1-f71.google.com with SMTP id
 fp4-20020a1709069e0400b00711911cecf9so4731749ejc.3
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 11:14:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eblE6PLI5GJsQn+RUbDAHWjNIRenvJU4Vj8ikWZA3Do=;
 b=Ypw5WdYUMho9MhxwxCWOWg4A+xfs7cO3xSdA9cNOV2N5pfKjrBM9WQ1B8fAzNlftrQ
 GDi7+ZV569aoP1zmj1gAcdX0V02rrQCWqcjJ0zVn76iU48WlaIuNpM2SilvxtaiciNPk
 SngyRtYMCHttSAQ7TTSIxvVFO2ra6Yf51tE9hGTew0Ot+fMEK6GU3+/BaQkzFp2JJLJp
 pG7hHl2OQs2FVPHP30VZxb5RJpcMZGJ3MIR97eaHqfA5FGWtCvH9e/SVJf+0AJmX6bdo
 5VG1ghnpBk6exu/OkOQE0x6SPFECJGXVXIKnuIclQ5QKUwlO3YQZPZ8Bts8cPzXNXK1Q
 iefg==
X-Gm-Message-State: AOAM532zULV0dD8k6OJWZG0561+1sYiaykkfZlWS/VcyIkdwPz1dh9Oz
 5t4oipk58WntQJlsb/L8pqgWlCsVMlOtSVdiCE0KbOXo3lCd/OOz6dcUyEo7jt0FQUG84kXi/dz
 frl1FbdsGwUrw5CdwlV5w3FVUiz1KYLA=
X-Received: by 2002:a05:6402:322a:b0:42e:1778:1f1f with SMTP id
 g42-20020a056402322a00b0042e17781f1fmr38373723eda.115.1654712088030; 
 Wed, 08 Jun 2022 11:14:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbrAu9Ca8B4b8mHTDVyksJJqg7BGk/ANsgbOB6PwG3G0Jya9gg/NrkGGUFOdXqiED3vv73eQADxLB0Pvq421M=
X-Received: by 2002:a05:6402:322a:b0:42e:1778:1f1f with SMTP id
 g42-20020a056402322a00b0042e17781f1fmr38373687eda.115.1654712087787; Wed, 08
 Jun 2022 11:14:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220513062836.965425-1-leobras@redhat.com>
 <20220513062836.965425-4-leobras@redhat.com>
 <b2fae41c-7f47-9bf1-21b9-1b123818a262@bytedance.com>
 <YpdwcHu7I8dGDimt@xz-m1.local>
 <CAJ6HWG7vxRzEN5CRf93m_afHPn9zvMdYe=DZ4pGKKBQ8gyTY+Q@mail.gmail.com>
 <YqCK1UBLjXzo+nm7@xz-m1.local>
In-Reply-To: <YqCK1UBLjXzo+nm7@xz-m1.local>
From: Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Date: Wed, 8 Jun 2022 15:14:36 -0300
Message-ID: <CAJ6HWG4UwU+em4pgk+uBLNZRx1jBThzYWXXp-nZg3EVLjuHVHQ@mail.gmail.com>
Subject: Re: [External] [PATCH v13 3/8] QIOChannelSocket: Implement io_writev
 zero copy flag & io_flush for CONFIG_LINUX
To: Peter Xu <peterx@redhat.com>
Cc: =?UTF-8?B?5b6Q6Zev?= <xuchuangxclwt@bytedance.com>, 
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org,
 Fam Zheng <fam@euphon.net>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, 
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 lizefan.x@bytedance.com, zhouyibo@bytedance.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 8, 2022 at 8:41 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Wed, Jun 08, 2022 at 02:37:28AM -0300, Leonardo Bras Soares Passos wrote:
> > (1) is not an option, as the interface currently uses ret=1 to make
> > sure MSG_ZEROCOPY is getting used,
> > I added that so the user of qio_channel can switch off zero-copy if
> > it's not getting used, and save some cpu.
>
> Yes (1) is not, but could you explain what do you mean by making sure
> MSG_ZEROCOPY being used?  Why is it relevant to the retval here?

If sendmsg() is called with MSG_ZEROCOPY, and everything is configured
correctly, the kernel will attempt to send the buffer using zero-copy.

Even with the right configuration on a recent enough kernel, there are
factors that can prevent zero-copy from happening, and the kernel will
fall back to the copying mechanism.
An example being the net device not supporting 'Scatter-Gather'
feature (NETIF_F_SG).

When this happens, there is an overhead for 'trying zero-copy first',
instead of just opting for the copying mechanism.

In a previous iteration of the patchset, it was made clear that it's
desirable to detect when the kernel falls back to copying mechanism,
so the user of 'QIOChannelSocket' can switch to copying and avoid the
overhead. This was done by the return value of flush(), which is 1 if
that occurs.

>
> I just figured it's a bit weird to return >0 here in flush().
>
> >
> > (2) is not a problem, but I fail to see how useful that would be. Is
> > the idea manually keeping track of flush happening?
>
> Yes if we can check this up it'll be good enough to me.  The trace point
> could help in some case in the future too to monitor the behavior of kernel
> MSG_ERRQUEUE but if you don't like it then it's okay.
>

TBH I am not sure how those traces work yet, and I am afraid it can
introduce some overhead in flush.
In any way, we can introduce this trace in a separated patch, since
fixing zero-copy flush seems more urgent right now.

Best regards,
Leo

> --
> Peter Xu
>


