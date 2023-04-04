Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A147A6D618D
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 14:47:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjg4B-0008NV-Kq; Tue, 04 Apr 2023 08:47:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjg46-0008J1-OL
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 08:47:10 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjg45-00044w-4h
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 08:47:10 -0400
Received: by mail-ed1-x52a.google.com with SMTP id t10so129924388edd.12
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 05:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680612426;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gTiTvr5EJsiRSOJuumrKsD3rDW5WUjtl1h0sLf8tVmE=;
 b=gok+EnWq6QslhnZRjDoqdRiG8Yp1Nt8RhDHIyyJIUIKIXbCl8soWn0jf5n/G6eGuaU
 UzQwoNOrxithgI33VkeyolyWbB41R6Scswtgd2VHDuOyISFK4ksYzhHUEu34U05/vzYK
 VmAqyIyFQqOsotqAj2r+ONXn8DNz+7cZaST0li79C1VtdxXrmQ+bjCciWOCSDuzG0bkf
 jcqsIsZUJ8R4kFztoXgWIKKp8bQV+q/Ms+uIDHIy4jwCUzGnstAFWRtXDz+sbD5Eh2iP
 +NSCKRte/R3eItz8O+w5d7J4QuGZD5NhOLayBulG1JySNHNjmEk9icCjPr7hOTaVzXIz
 0AHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680612426;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gTiTvr5EJsiRSOJuumrKsD3rDW5WUjtl1h0sLf8tVmE=;
 b=T99QV2OpVWQODWJEi+AvHqmQqBHkxysEn64uB5I8sS6RFZCLzIeqdry/MpVPEzI+5e
 8TZlKMSakC+9v60lqJOowRWWz1nO1Ep7Lq/ATVGd71tGe2QXG2wnKaz3gQwY+r47ayKe
 2KlR7tk2ptbMg+OfNknPYMs29xTAdGFTHzEcfXQmEIFcDzfg7NCHqQxa9SUY24FJ5KXw
 5v5frxccavNpK3RNYdyE141npjf0AQLU7e6Arr8SYy3+w+6ryf43E+Bu7188cISv9f/Z
 VQGGiEdfdQ4R+dR2seQ5E79jGiz5WPytfo/oTOnxlJhcR4Ly5SCvCvFfhDaMvsRIUC54
 UpJg==
X-Gm-Message-State: AAQBX9ePoHbtTU/YxP3//WDH+76o0Ig7LHX6CyTaCUmzDv7UgmraOvp7
 sGL/Aa2cqpqA2iGvTLjonyIFbSDXFOspqvVKMJPlFw==
X-Google-Smtp-Source: AKy350YcOsXIXTqbNuZ7Q0NV2GoTysZObfbUCrrCuQC7IMW8hIvIAkssG2vvbV1fX4f3CXXi+jvSPSnA7VX5lbzaJcA=
X-Received: by 2002:a05:6402:a47:b0:502:3e65:44f7 with SMTP id
 bt7-20020a0564020a4700b005023e6544f7mr11673662edb.3.1680612426575; Tue, 04
 Apr 2023 05:47:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230404115912.2829251-1-armbru@redhat.com>
 <20230404115912.2829251-11-armbru@redhat.com>
In-Reply-To: <20230404115912.2829251-11-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Apr 2023 13:46:56 +0100
Message-ID: <CAFEAcA9rsa3mFO6TWUD5kwy47fd-Ctv=SEuk-Omd5hq4X5h-xQ@mail.gmail.com>
Subject: Re: [PATCH 10/16] qapi: Fix unintended definition lists in
 documentation
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, michael.roth@amd.com, eblake@redhat.com, 
 kwolf@redhat.com, hreitz@redhat.com, pbonzini@redhat.com, 
 marcandre.lureau@redhat.com, arei.gonglei@huawei.com, pizhenwei@bytedance.com, 
 jsnow@redhat.com, vsementsov@yandex-team.ru, eduardo@habkost.net, 
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com, quintela@redhat.com, 
 jasowang@redhat.com, yuval.shaia.ml@gmail.com, stefanha@redhat.com, 
 kraxel@redhat.com, kkostiuk@redhat.com, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, 4 Apr 2023 at 12:59, Markus Armbruster <armbru@redhat.com> wrote:
>
> rST parses something like
>
>     first line
>         second line
>
> as a definition list item, where "first line" is the term being
> defined by "second line".
>
> This bites us in a couple of places.  Here's one:
>
>     # @bps_max: total throughput limit during bursts,
>     #                     in bytes (Since 1.7)
>
> scripts/qapi/parser.py parses this into an "argument section" with
> name "bps_max" and text
>
>     total throughput limit during bursts,
>               in bytes (Since 1.7)
>
> docs/sphinx/qapidoc.py duly passes the text to the rST parser, which
> parses it as another definition list.  Comes out as nested
> definitions: term "bps_max: int (optional)" defined as term "total
> throughput limit during bursts," defined as "in bytes (Since 1.7)".
>
> rST truly is the Perl of ASCII-based markups.
>
> Fix by deleting the extra indentation.
>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

