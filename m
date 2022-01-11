Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 144D448B417
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 18:35:01 +0100 (CET)
Received: from localhost ([::1]:50318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7L2w-000138-Tf
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 12:34:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <roman@roolebo.dev>) id 1n7KlV-0002vP-7C
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 12:16:57 -0500
Received: from [2a00:1450:4864:20::142] (port=42830
 helo=mail-lf1-x142.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <roman@roolebo.dev>) id 1n7KlO-0008LA-VA
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 12:16:52 -0500
Received: by mail-lf1-x142.google.com with SMTP id h2so58759406lfv.9
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 09:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=roolebo.dev; s=mail;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=9QHsYilftFzT4HXHmYeuBqn+keQwDqRn3OTVGk877rY=;
 b=aEx6jMBKXAPqccyuLrtHCkidiI3kEOBnJjyMxoT9Pii/ihZoewl0Tuwp1x6rSmYVlB
 nCcVp9IyXNhzlWcF1UH/9Epqnvk/CU+ABAHFpRoZBvlgltAsbgStQOJz+t0RdgTWaiBS
 7sp++FtLGPvPjq+W65IFAYg0agJZT2XeLQTm7CKL+5yU9xxabIw/F8IdAU3eJDZ+Q4dG
 KwWB22P7IJr4nV8hBN86ZGk+UxRww4uNkHl4DSjIvLkdtdE/Frl47jop/wd+btBH7u9k
 yRhGvl5uYSOiI2uxwjloRBPDLfPlwkNO9dvJvFJlhH7tA/tDBg2O+xhAks3m8903Y8aX
 EKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=9QHsYilftFzT4HXHmYeuBqn+keQwDqRn3OTVGk877rY=;
 b=nPent4DhdmBvYJrAmmOKBKX3JlaMzR/wxu+dZiD4yOC4LlWpVXH+06foJti+CDTF1C
 o5v9hXoLZ5UVBwDOp/1VSzq105EQDcN9q237ybxRhdhjrUjWh4HxD4TcGI1DP5MA1Ct3
 69+T/reagRphK27eacTlkTHo3dLIl4Nt0lhMzkJIex5550sYbeoJM5WZTs0SfE9ypyoJ
 0X5S8pfaIOeNUNLjWZ2VIs6F8yhhyrrmI74UYmqT1FRodbRCcHlyG95Aw3jh2LtNRelh
 /AA+j/m0VG5CbBgLBjDoGa9o6qwICB7gjiXLOUTZqdeI25MGEysB1WMpUre6r6Mu6egw
 7gZA==
X-Gm-Message-State: AOAM531Vj0yCGEthVRgOT2vQkgF8wis0HH56hzWPWjNWScd4819BXklQ
 uteaHrrrcOQCs9nTI4D3YQXeTA==
X-Google-Smtp-Source: ABdhPJzKSX3v7TFqgBeOSHBcpVaUBqeuO6X1zAUjYeY+Hl9DXxBpLtAxdNBNxUShr6aFp6a4k7Gs5A==
X-Received: by 2002:a2e:b80c:: with SMTP id u12mr3401621ljo.387.1641921406427; 
 Tue, 11 Jan 2022 09:16:46 -0800 (PST)
Received: from localhost (ip-185-108-208-32.ip.asarta.ru. [185.108.208.32])
 by smtp.gmail.com with ESMTPSA id m8sm114827lfu.20.2022.01.11.09.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 09:16:46 -0800 (PST)
Date: Tue, 11 Jan 2022 20:16:45 +0300
From: Roman Bolshakov <roman@roolebo.dev>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH v3 1/7] configure: Allow passing extra Objective C
 compiler flags
Message-ID: <Yd27fVx1iHyvA9ng@roolebo.dev>
References: <20220110131001.614319-1-f4bug@amsat.org>
 <20220110131001.614319-2-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220110131001.614319-2-f4bug@amsat.org>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::142
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::142;
 envelope-from=roman@roolebo.dev; helo=mail-lf1-x142.google.com
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

On Mon, Jan 10, 2022 at 02:09:55PM +0100, Philippe Mathieu-Daudé wrote:
> We can pass C/CPP/LD flags via CFLAGS/CXXFLAGS/LDFLAGS environment
> variables, or via configure --extra-cflags / --extra-cxxflags /
> --extra-ldflags options. Provide similar behavior for Objective C:
> use existing flags from $OBJCFLAGS, or passed via --extra-objcflags.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  configure   | 8 ++++++++
>  meson.build | 5 +++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/configure b/configure
> index 0c57a063c66..adb42d8beb1 100755
> --- a/configure
> +++ b/configure
> @@ -288,6 +288,7 @@ done
>  
>  EXTRA_CFLAGS=""
>  EXTRA_CXXFLAGS=""
> +EXTRA_OBJCFLAGS=""
>  EXTRA_LDFLAGS=""
>  
>  xen_ctrl_version="$default_feature"
> @@ -400,9 +401,12 @@ for opt do
>    --extra-cflags=*)
>      EXTRA_CFLAGS="$EXTRA_CFLAGS $optarg"
>      EXTRA_CXXFLAGS="$EXTRA_CXXFLAGS $optarg"
> +    EXTRA_OBJCFLAGS="$EXTRA_OBJCFLAGS $optarg"
>      ;;
>    --extra-cxxflags=*) EXTRA_CXXFLAGS="$EXTRA_CXXFLAGS $optarg"
>    ;;
> +  --extra-objcflags=*) EXTRA_OBJCFLAGS="$EXTRA_OBJCFLAGS $optarg"
> +  ;;
>    --extra-ldflags=*) EXTRA_LDFLAGS="$EXTRA_LDFLAGS $optarg"
>    ;;
>    --enable-debug-info) debug_info="yes"
> @@ -781,6 +785,8 @@ for opt do
>    ;;
>    --extra-cxxflags=*)
>    ;;
> +  --extra-objcflags=*)
> +  ;;
>    --extra-ldflags=*)
>    ;;
>    --enable-debug-info)
> @@ -1318,6 +1324,7 @@ Advanced options (experts only):
>    --objcc=OBJCC            use Objective-C compiler OBJCC [$objcc]
>    --extra-cflags=CFLAGS    append extra C compiler flags CFLAGS
>    --extra-cxxflags=CXXFLAGS append extra C++ compiler flags CXXFLAGS
> +  --extra-objcflags=OBJCFLAGS append extra Objective C compiler flags OBJCFLAGS
>    --extra-ldflags=LDFLAGS  append extra linker flags LDFLAGS
>    --cross-cc-ARCH=CC       use compiler when building ARCH guest test cases
>    --cross-cc-flags-ARCH=   use compiler flags when building ARCH guest tests
> @@ -3843,6 +3850,7 @@ if test "$skip_meson" = no; then
>    echo "[built-in options]" >> $cross
>    echo "c_args = [$(meson_quote $CFLAGS $EXTRA_CFLAGS)]" >> $cross
>    echo "cpp_args = [$(meson_quote $CXXFLAGS $EXTRA_CXXFLAGS)]" >> $cross
> +  test -n "$objcc" && echo "objc_args = [$(meson_quote $OBJCFLAGS $EXTRA_OBJCFLAGS)]" >> $cross
>    echo "c_link_args = [$(meson_quote $CFLAGS $LDFLAGS $EXTRA_CFLAGS $EXTRA_LDFLAGS)]" >> $cross
>    echo "cpp_link_args = [$(meson_quote $CXXFLAGS $LDFLAGS $EXTRA_CXXFLAGS $EXTRA_LDFLAGS)]" >> $cross
>    echo "[binaries]" >> $cross
> diff --git a/meson.build b/meson.build
> index 0e52f54b100..a21305d62c1 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -3286,6 +3286,11 @@
>                                                 + ['-O' + get_option('optimization')]
>                                                 + (get_option('debug') ? ['-g'] : []))}
>  endif
> +if targetos == 'darwin'
> +  summary_info += {'OBJCFLAGS':       ' '.join(get_option('objc_args')
> +                                               + ['-O' + get_option('optimization')]
> +                                               + (get_option('debug') ? ['-g'] : []))}

Hi Philippe,

You need to add something like below to actually use the flags in build:

add_global_arguments(config_host['QEMU_OBJCFLAGS'].split(),
                     native: false, language: 'objc')

Regards,
Roman

> +endif
>  link_args = get_option(link_language + '_link_args')
>  if link_args.length() > 0
>    summary_info += {'LDFLAGS':         ' '.join(link_args)}
> -- 
> 2.33.1

