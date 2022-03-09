Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 967614D2ABA
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 09:36:48 +0100 (CET)
Received: from localhost ([::1]:57224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRroN-0003Ls-ME
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 03:36:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nRrmb-0002I7-Hy
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 03:34:57 -0500
Received: from [2607:f8b0:4864:20::62a] (port=45963
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nRrmZ-0006AK-Lr
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 03:34:57 -0500
Received: by mail-pl1-x62a.google.com with SMTP id q13so1321690plk.12
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 00:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jZPmLNW6pIC6uCRDKd0Qvp4/fecmxGmZ0Gztqmc8Rno=;
 b=n3iTHaBlx5HI50dn+3L3fuhw4VOceykzE/Ax9gZf92zvo59l7e1Z8TNkwAZN7/qjeH
 q1k92lAVPr43+UGp8m8W2VtRROyrTOdxMKK9Cjpk7hFKyOXiroEAcjWHsTfoj3JL7PHH
 8AxdHCGne6d6bxskBbc6SL99/m8BVzb4tlpFayQLs67h8W3c7lssuAky6DPi+VxYU2na
 lS299tbXZsn7CqyAabqYWlM7DhWDdLWXOm7WvuExH4GBRUQHAepFxRUzcGiC6DWHzUql
 kSWUljRsqPHr9a7EcuF7i+CeBXpMliQlb6XliHntDvTkwNFjDQBF3FQ4Y1AvRYxceJON
 sivg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jZPmLNW6pIC6uCRDKd0Qvp4/fecmxGmZ0Gztqmc8Rno=;
 b=AikgFwP3z1yBSTZT+so3sfvA8/iQWQitXIBJnaOr8gpDujBXLrlC3tG6jgpEZRrjSi
 jiSET0L4wqrmiGSwwun2/W1ERCRyqCsRLmk/wWX546ccOzyfYXbrsCgKcJJXP2RkBE5z
 pIpgT5o7UQUEjBue/glBZWiqsInLn7S8ZWi23iwho3md6yAm+38tgKNIeuoZp8DXbJVo
 ATYP2Hq63Mn6xFnyl6v0+SgDGe6NxBL5wTJBOYsJK6gS2ZkMMRKiGbz7UCrd8BMLxB+C
 MQXWGGGPpdDz5LdewigYJpPnlocNEUdNqdbZbiqBzqYdC+ZUKudzaw52Km3TmJx90Qux
 /05g==
X-Gm-Message-State: AOAM531TtudkaEPBZ1mJGpELQRGCpdKjtZq5jwH4RTiedzoJdlZxuWxW
 zIn1+BhGstp+1H7fAcUkDSU=
X-Google-Smtp-Source: ABdhPJw9yQ9waDl7vvIjtve37LK2e/sWXLUipeu6L6GNWLvkPL99yviYUAwnjxeMLIraK1E6mJu8dg==
X-Received: by 2002:a17:903:41c1:b0:151:f026:804f with SMTP id
 u1-20020a17090341c100b00151f026804fmr12666369ple.23.1646814894380; 
 Wed, 09 Mar 2022 00:34:54 -0800 (PST)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 s20-20020a056a00179400b004f709998d13sm1861602pfg.10.2022.03.09.00.34.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 00:34:53 -0800 (PST)
Message-ID: <76c68a33-b157-f127-36ee-034290bf3e4b@gmail.com>
Date: Wed, 9 Mar 2022 17:34:51 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 12/12] ui/console: call gfx_switch() even if the
 current scanout is GL
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <20220307074632.238049-1-marcandre.lureau@redhat.com>
 <20220307074632.238049-13-marcandre.lureau@redhat.com>
 <c80fde18-bb3e-e780-356c-f935e7390e4d@gmail.com>
 <CAMxuvaw_QT4wEGLZRNJEd1m-58JV-8AOc6CHKkMw4i_yrVNgew@mail.gmail.com>
 <28ef9b06-3225-112f-b664-176e67c824d9@gmail.com>
 <CAMxuvaz3+ySgiOxawVT=P7x4ikDcap0o5Ux78_HdewL0XXa5Kg@mail.gmail.com>
 <d7df9ba7-40db-7b2a-63d7-eacf811da4f2@gmail.com>
 <CAMxuvaxU56M9AvS9XfZWVBNYSORBTqWmZf3yteK8KfVcdh9Ltw@mail.gmail.com>
 <f06f3b30-eb9d-17c7-3bac-ee2a31c158f2@gmail.com>
 <CAMxuvawuMvxWx7xtsf=PbWnu7UypNfVWf+Bufeqbi4J=SjsU9w@mail.gmail.com>
 <1fa142fb-7988-db25-c283-a6b16278f628@gmail.com>
 <CAJ+F1CLDm9+myAJdNQdU2y64Fa-2+ew2oGih_cWim1=vO=sLMw@mail.gmail.com>
 <e1a9ab86-912b-2628-1e60-4aec4eac25d3@gmail.com>
 <CAJ+F1CKJHqA5DJv1WvY8q0k2rNW+ERFbFgMGKggMuMUJCPs5vg@mail.gmail.com>
 <2517a6b9-cc34-3bb1-d17e-d4e30f0e68b7@gmail.com>
 <CAJ+F1CKrDnYdMKNh1nu8LjnQ=gJ9-umgGHW-E1D1sFO1gf=Rdg@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <CAJ+F1CKrDnYdMKNh1nu8LjnQ=gJ9-umgGHW-E1D1sFO1gf=Rdg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/03/09 17:33, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Mar 9, 2022 at 12:21 PM Akihiko Odaki <akihiko.odaki@gmail.com 
> <mailto:akihiko.odaki@gmail.com>> wrote:
> 
> 
>     If it is expected that dpy_gfx_update is required, it should call
>     dpy_gfx_update. I agree it is not a right timing to fix vnc to remove
>     the implicit update as it is pre-existing.
>     However the lack of dpy_gfx_update call is a regression and should
>     be fixed.
> 
> 
> Calling dpy_gfx_update is done when the scanount.kind is SURFACE.
> 
> dpy_gfx_update is specific to SURFACE, GL uses dpy_gl_update.
> 
> -- 
> Marc-André Lureau

egl-headless requires non-OpenGL to display the surface content even if 
scanout.kind is not SURFACE. Calling dpy_gfx_update is done when the 
scanount.kind is SURFACE is not enough.

Regards,
Akihiko Odaki

