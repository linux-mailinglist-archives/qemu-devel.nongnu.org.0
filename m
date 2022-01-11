Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C13D48B1DF
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 17:17:43 +0100 (CET)
Received: from localhost ([::1]:40660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7JqA-0008Ub-MJ
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 11:17:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <roman@roolebo.dev>) id 1n7JiH-0001wd-V3
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 11:09:38 -0500
Received: from [2a00:1450:4864:20::134] (port=42520
 helo=mail-lf1-x134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <roman@roolebo.dev>) id 1n7JiG-0005f1-Jo
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 11:09:33 -0500
Received: by mail-lf1-x134.google.com with SMTP id h2so58052435lfv.9
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 08:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=roolebo.dev; s=mail;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=rG4q6uQnR9SrOUhEZdWm8hVX5bOXBHhU1zvaEB+Ausk=;
 b=JrPx5KI2niGYqVcg+HkYr+Rmtlkno4rjXHJmvnTw2vhob3bXnBmysT5BwMcooabmwP
 PBX/FNfkkBoywTd/rM3oprxVssPxZJcnRsAwOu0qpbJDLXp863xt5nxpc6vxGtkAAzta
 BXkDRA+bFd75JjJVO/+A/lj6LP2VOCEHKfxdaBT+U+tCDkDJrpW4O0/ZycO6Bnfln4iA
 Y/pqDp+sZ81zQbqlVt+taej2x6RVLmDEcW7YgBPvuRycxx9aSvY/lPbl5vuB37bdnZdP
 uI/7qR7KsFJNut0JnoReI2xJ23kslWRfexVoiTwL3JR+l0N4AtYkz1AZX1gZNe4LQ1Cn
 2wlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=rG4q6uQnR9SrOUhEZdWm8hVX5bOXBHhU1zvaEB+Ausk=;
 b=fp1Qt+mcM12PHBks5QWMAO7+/BsArIFdTxpZw5Aovb6NjeM2fr/Dh/jefJ6iPDBaH5
 zp/5+9qvdhXjYtvbj9WP+Oi+JhmPgdd35/mHUo1wyq1hX3SvbcZqlKLGIZe1PrCt1uJI
 /ubbmKVpcm5TtigI9OwQj961Pxuvh8O1wyka0ZkfyNiN9u6kKMcF7lpXqJnB1+RPSZJ/
 /wzmdnLHrzQBT0i/VNxhoiJ379RyE3+58Fn3sRvOeXXQOcyZzTFiZOyGZAr4FtC3EDCg
 ihqk6vokqxHcWx+DkBN/7/3pDrY5zS2q8iF79fS2Kky31INdh1u5DHb29nglm5z17FWs
 tQHQ==
X-Gm-Message-State: AOAM533I5GnkaRGIC01+PzfHrZlfqiRE/1f3H606CoKHG6M6NH63DoWm
 Qk3kwF/rSk2T5wOKHKmAH3MkJg==
X-Google-Smtp-Source: ABdhPJy0an/WSFveKbImqPux+q2qBQmmRK9svvSgZrIpSG6YcK74oWN2YXG4Bi6v8D7Iqys7ZHZHlg==
X-Received: by 2002:ac2:4651:: with SMTP id s17mr4022968lfo.347.1641917367791; 
 Tue, 11 Jan 2022 08:09:27 -0800 (PST)
Received: from localhost (ip-185-108-208-32.ip.asarta.ru. [185.108.208.32])
 by smtp.gmail.com with ESMTPSA id o1sm1372016lfq.239.2022.01.11.08.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 08:09:27 -0800 (PST)
Date: Tue, 11 Jan 2022 19:09:26 +0300
From: Roman Bolshakov <roman@roolebo.dev>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH v3 3/7] hvf: Make hvf_get_segments() /
 hvf_put_segments() local
Message-ID: <Yd2lLEgwvgMnzHIZ@MacBook-Air-Roman.local>
References: <20220110131001.614319-1-f4bug@amsat.org>
 <20220110131001.614319-4-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220110131001.614319-4-f4bug@amsat.org>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::134
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::134;
 envelope-from=roman@roolebo.dev; helo=mail-lf1-x134.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 10, 2022 at 02:09:57PM +0100, Philippe Mathieu-Daudé wrote:
> Both hvf_get_segments/hvf_put_segments() functions are only
> used within x86hvf.c: do not declare them as public API.
> 

Reviewed-by: Roman Bolshakov <roman@roolebo.dev>
Tested-by: Roman Bolshakov <roman@roolebo.dev>

Thanks,
Roman

> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/i386/hvf/x86hvf.h | 2 --
>  target/i386/hvf/x86hvf.c | 4 ++--
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/target/i386/hvf/x86hvf.h b/target/i386/hvf/x86hvf.h
> index 99ed8d608dd..db6003d6bda 100644
> --- a/target/i386/hvf/x86hvf.h
> +++ b/target/i386/hvf/x86hvf.h
> @@ -26,11 +26,9 @@ void hvf_set_segment(struct CPUState *cpu, struct vmx_segment *vmx_seg,
>                       SegmentCache *qseg, bool is_tr);
>  void hvf_get_segment(SegmentCache *qseg, struct vmx_segment *vmx_seg);
>  void hvf_put_xsave(CPUState *cpu_state);
> -void hvf_put_segments(CPUState *cpu_state);
>  void hvf_put_msrs(CPUState *cpu_state);
>  void hvf_get_xsave(CPUState *cpu_state);
>  void hvf_get_msrs(CPUState *cpu_state);
>  void vmx_clear_int_window_exiting(CPUState *cpu);
> -void hvf_get_segments(CPUState *cpu_state);
>  void vmx_update_tpr(CPUState *cpu);
>  #endif
> diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
> index 05ec1bddc4e..907f09f1b43 100644
> --- a/target/i386/hvf/x86hvf.c
> +++ b/target/i386/hvf/x86hvf.c
> @@ -83,7 +83,7 @@ void hvf_put_xsave(CPUState *cpu_state)
>      }
>  }
>  
> -void hvf_put_segments(CPUState *cpu_state)
> +static void hvf_put_segments(CPUState *cpu_state)
>  {
>      CPUX86State *env = &X86_CPU(cpu_state)->env;
>      struct vmx_segment seg;
> @@ -166,7 +166,7 @@ void hvf_get_xsave(CPUState *cpu_state)
>      x86_cpu_xrstor_all_areas(X86_CPU(cpu_state), xsave, xsave_len);
>  }
>  
> -void hvf_get_segments(CPUState *cpu_state)
> +static void hvf_get_segments(CPUState *cpu_state)
>  {
>      CPUX86State *env = &X86_CPU(cpu_state)->env;
>  
> -- 
> 2.33.1

