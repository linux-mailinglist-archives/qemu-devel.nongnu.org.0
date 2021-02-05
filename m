Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FE3311216
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 21:17:07 +0100 (CET)
Received: from localhost ([::1]:51754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l87XO-00079B-9f
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 15:17:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l87V9-0006AU-Tl
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 15:14:47 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:43106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l87V7-0003lM-UP
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 15:14:47 -0500
Received: by mail-pl1-x630.google.com with SMTP id 8so4125381plc.10
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 12:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UN8SmGU45KBjyYJCZ4q4aL+iGJBVwSSsluft4VeySdM=;
 b=kNSnSQEYDLOuG9eT8Ocaq1WKw8AzxOrRPGaVMcAa9RQZuYUsbpVRjUcgupPEwtRZCw
 LDx2r1ivM2mD32TEJeOrUn9JFMuSUAU68ypJJvpUvFuRoIGMe3/Zp7jRwVsAbcY72Za+
 vQOxtnaAcc9Xsl00yzr4Ra8GFElQ1fbDXRpBwvqESc6G7uWNLBqOUeZhXp5gUHB1B+mX
 NpJmVNxrSNOgKP+jyH4EDz8ahTkD0cFqNk+00yPlGaWpYpE3ArcnbX0ihSKCRoPVkddI
 lC3krnc1N5R0ao4G9tWZF97yKDqvwKK3oFEM/qGJJAdtWnpMT7sA8wA+zABzcLpKfYZn
 U/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UN8SmGU45KBjyYJCZ4q4aL+iGJBVwSSsluft4VeySdM=;
 b=fO7Q7wnUBAwd4aO2c18knRxGfXhwAAByOtKNMSPcKh1pjM2/wLz1HGeC+3AQP5iTtX
 b8/n48tAHYSgjTOWxW24uT1nN9lGufv19pMW8blDLeXLBnW9tTSxntjBxgnKwB+VEZIt
 curQ7vqtpyvSAxWUrXraLzy/k8FGuGNRCIGepczxUKBZuVDl2xsYX+dky+iu9EHpmGVM
 SKwHwM1QikNpd2EXVFDCKa08BIPpjq0tb0/fFp5gYRB2Sr3Fl24pZ/70rKyzMURmnolO
 zsjqvhgnp1gnDIhOsB3+5fkaCTTK45Dpco3D6a7qofxsG+1PhuYwmU3ov+rXmj/Vl2Hz
 2Oew==
X-Gm-Message-State: AOAM5324Y3zSjXEJuw6CxxuwtmfjKmMzq02zpwuqsoju4Z65hd2UVvg7
 JI3NfbV102VI9NFwwHxghVu9FQMDJXcBbEOW
X-Google-Smtp-Source: ABdhPJycbtEq/07siu0mrcNzSGHCqizY4ip/MsrrlDmOSKh5WmlHlRxXSsDdWpFvIO5jbG1iUGjRVQ==
X-Received: by 2002:a17:902:e8cb:b029:e2:9906:45a6 with SMTP id
 v11-20020a170902e8cbb02900e2990645a6mr5591704plg.41.1612556084267; 
 Fri, 05 Feb 2021 12:14:44 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id s18sm7936976pfm.129.2021.02.05.12.14.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Feb 2021 12:14:42 -0800 (PST)
Subject: Re: [PATCH v16 21/23] accel: introduce new accessor functions
To: Claudio Fontana <cfontana@suse.de>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210204163931.7358-1-cfontana@suse.de>
 <20210204163931.7358-22-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2bb1cba6-e1a0-80a7-4c05-fb221f4f8230@linaro.org>
Date: Fri, 5 Feb 2021 10:14:39 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210204163931.7358-22-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.33,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/21 6:39 AM, Claudio Fontana wrote:
> @@ -6725,10 +6722,8 @@ static void x86_cpu_initfn(Object *obj)
>          x86_cpu_load_model(cpu, xcc->model);
>      }
>  
> -    /* if required, do the accelerator-specific cpu initialization */
> -    if (cc->accel_cpu) {
> -        cc->accel_cpu->cpu_instance_init(CPU(obj));
> -    }
> +    /* if required, do accelerator-specific cpu initializations */
> +    accel_cpu_instance_init(CPU(obj));
>  }

Why is this only done for x86?


r~

