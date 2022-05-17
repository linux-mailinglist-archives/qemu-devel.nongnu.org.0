Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B85EA52A630
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 17:24:09 +0200 (CEST)
Received: from localhost ([::1]:34952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqz3Q-0005Wp-Ow
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 11:24:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqz0l-0003N5-5O
 for qemu-devel@nongnu.org; Tue, 17 May 2022 11:21:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqz0i-0000IH-EU
 for qemu-devel@nongnu.org; Tue, 17 May 2022 11:21:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652800879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/JqSnDFkx+YFcZz/dEzMpkPH3fZZOF1jcwYZIRDn5cU=;
 b=B53hCFfrYfxp9f7+sbryTg6WKQ1x4PwaoRqd/99JGdtWiahA2AYXiZTVvmDAvEMeE8m/rf
 2m+4mxKapIQOFxDhVpKP3Cs421bQkSdAEssvfLL/ZnhC4B2qtyN7/N2Il7sxm5MfYs2DKi
 PQFimJLNl3rFwBuUBN4X76dUZFUSbl8=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-507-v_EZVaoyNWWi1XdEqKDxjg-1; Tue, 17 May 2022 11:21:18 -0400
X-MC-Unique: v_EZVaoyNWWi1XdEqKDxjg-1
Received: by mail-pl1-f199.google.com with SMTP id
 q13-20020a170902eb8d00b0016146ab913aso5078755plg.17
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 08:21:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/JqSnDFkx+YFcZz/dEzMpkPH3fZZOF1jcwYZIRDn5cU=;
 b=4YlMG6rRyac9KcDCRlt/AYaZwqoxy4VtwVjhEy3044k6HxWXtFGpt7jkXtqwl8j26+
 Uwi84rrugJRgu2WGzPd7+LGp1H+kMixbBlgq4pNR1rSzETMcbFlZb05Aw9esuPIxwk+J
 p6nIwYlTTltEw96vf9Pwil6H0om19gbLnV9jdIZYNwPKs6hC6OY86jBjcIhbQnTUZFw7
 p9g5WqXAQsqzyVGPhmjZTMc342QWTgz7nlHPes13mklzlLN8xHm07dhql+rOu+04fN77
 1sQuv06P8ya14hE/uJ75Ykx+QG0IdUKZpdNTBhS9d9nZVG1C8DakYJDrf1W5ulV6z6vx
 RAnw==
X-Gm-Message-State: AOAM531ZLU8l2ZS1lqOkRsdRGVhe+ZMfvAw/1VJhQj2Q6DB00yXuIDgn
 oR2fcCjGnUjXCh7Uc5+EMJR7UFnQOq/MZUNPFzXA7SAuqsA+2U0xBOEkqhaJ4KZrU7gj5OI0M+A
 QuNW9Rb1e3F7d4Pt8AsQJjozyP/oLe78=
X-Received: by 2002:a17:90a:764b:b0:1df:58f2:784c with SMTP id
 s11-20020a17090a764b00b001df58f2784cmr10663100pjl.122.1652800877549; 
 Tue, 17 May 2022 08:21:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVVyD+6LbZRHU37o0zJJglDVSx0hMPv9vZQrUOrG4AQEScB7ghykFV/phfp7E0/S28s9vreI/R93XIauLh4AQ=
X-Received: by 2002:a17:90a:764b:b0:1df:58f2:784c with SMTP id
 s11-20020a17090a764b00b001df58f2784cmr10663070pjl.122.1652800877107; Tue, 17
 May 2022 08:21:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220514065012.1149539-1-pbonzini@redhat.com>
 <20220514065012.1149539-3-pbonzini@redhat.com>
 <YoO9HrmmpvBBN9Zi@stefanha-x1.localdomain>
In-Reply-To: <YoO9HrmmpvBBN9Zi@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 17 May 2022 17:21:05 +0200
Message-ID: <CABgObfb_Sg-J-t16Y=5o6HKpnC6orfpFvuBfzTsbs4-qXSieLQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] thread-pool: replace semaphore with condition
 variable
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Nicolas Saenz Julienne <nsaenzju@redhat.com>, 
 =?UTF-8?B?THVrw6HFoSBEb2t0b3I=?= <ldoktor@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, May 17, 2022 at 5:20 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Sat, May 14, 2022 at 08:50:11AM +0200, Paolo Bonzini wrote:
> > @@ -134,6 +122,12 @@ static void *worker_thread(void *opaque)
> >      pool->cur_threads--;
> >      qemu_cond_signal(&pool->worker_stopped);
> >      qemu_mutex_unlock(&pool->lock);
> > +
> > +    /*
> > +     * Wake up another thread, in case we got a wakeup but decided
> > +     * to exit due to pool->cur_threads > pool->max_threads.
> > +     */
> > +    qemu_cond_signal(&pool->worker_stopped);
>
> &pool->worker_stopped? Was this supposed to be &pool->request_cond?

Yes, of course.

Paolo


