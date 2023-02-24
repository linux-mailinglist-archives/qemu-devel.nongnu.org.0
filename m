Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C76C66A1608
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 05:53:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVQ3W-0003MW-DL; Thu, 23 Feb 2023 23:51:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1pVQ3U-0003M6-Cv
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 23:51:36 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1pVQ3S-0001rE-AE
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 23:51:35 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 z20-20020a17090a8b9400b002372d7f823eso1570154pjn.4
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 20:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J43JR763/XOOcnwOEaHcdAzzKw16zBZYqD5nSu067sU=;
 b=bW2K+rvAs2sz2DPcdr9ac0hvjaoYb9me0plzfMochx9A1lummp6KV76fSsoiySLrzf
 rx+d7pOgsgr5bsd8tEuYhbwLpTj/lgp+avjgjD3Of4hctr9UgD/B5ovVfPS49fFzS3gC
 k30nE0H/TZk9HViSy8X9bfs/Du2M+F/d3HyoGslcRxbeLY+SOok6tGI1NaHtlxdzu3x1
 dogSxVMMWnmrxHujOfc1c2xiP0EOHCAopwO6xXDI5E/ZvUAY2NUdur3XnHWGI6qSHdID
 80VAVOB8I52oyl0lml+2VxBERSJipPfsZefeKmcSXyoY73nBS2lx4xsE5c+ee5KsMwEG
 T30A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J43JR763/XOOcnwOEaHcdAzzKw16zBZYqD5nSu067sU=;
 b=5Ow1FoaHqy1PiYEiHJurn4clMTU54CDwLcYUq5HRlaT5sPJz1aI/u//nTG+XBQR12r
 5UOHd4dot83dxgVj7Nr6NedqIl3rhzrmzysgCoe/rcdN62E9LoBZ1kx5YVMw2Qy7pLkR
 zOO8vaG1x4kX0rZEiaVBEeryGIdxAnjTYzVflWGc8sQFUFMNarL15K2S/E0dR3Vl2pe2
 ciT8XdEmiIjScJFD8zLAyT0wfg2t3xuOIn//VFWBZl1YpysxQaSsWUuG+g+hd7BBpH+Q
 eWPlb3XyXMwE3sKK6J0ETNpiIV88dOTm2s35f23sZpyoY5HVDuyW7Q7l8/ntRI86CdPo
 PavQ==
X-Gm-Message-State: AO0yUKWMrkMX2t2vBTYzzAibmgugpEc1w3DzyU/s3Lq345+A+iK7IuAe
 Uq5i5GoShno9ZFxyWlzPx2w=
X-Google-Smtp-Source: AK7set9IczEAriOz1b1IDgIFL2uGfc/mjlo66rxibqcjB6pVelkxf7ecf+tHESrJR4f44E9ZxAXegQ==
X-Received: by 2002:a17:902:e888:b0:19a:95ab:6b2b with SMTP id
 w8-20020a170902e88800b0019a95ab6b2bmr17751645plg.69.1677214292222; 
 Thu, 23 Feb 2023 20:51:32 -0800 (PST)
Received: from [10.213.81.57] ([157.82.194.11])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a170902d70500b0019608291564sm4087240ply.134.2023.02.23.20.51.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 20:51:31 -0800 (PST)
Message-ID: <b72ffae1-f640-cacb-ef47-b3593edb1bab@gmail.com>
Date: Fri, 24 Feb 2023 13:51:27 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PULL v2 00/36] Testing, docs, semihosting and plugin updates
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Richard Henderson
 <richard.henderson@linaro.org>, Emilio Cota <cota@braap.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20230202160109.2061994-1-alex.bennee@linaro.org>
 <01d13cc2-f346-71a7-d941-2d1a0dc42514@linaro.org>
 <0d17e82c-4226-84fb-9301-644935d326e4@linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <0d17e82c-4226-84fb-9301-644935d326e4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 2023/02/23 21:59, Philippe Mathieu-Daudé wrote:
> On 3/2/23 18:38, Philippe Mathieu-Daudé wrote:
>> On 2/2/23 17:01, Alex Bennée wrote:
> 
>>> ----------------------------------------------------------------
>>> Testing, docs, semihosting and plugin updates
> 
>>> ----------------------------------------------------------------
>> FTR I'm now seeing this warning on Darwin/Aarch64:
>>
>> C compiler for the host machine: clang (clang 14.0.0 "Apple clang 
>> version 14.0.0 (clang-1400.0.29.202)")
>> C linker for the host machine: clang ld64 820.1
>> Host machine cpu family: aarch64
>> Host machine cpu: aarch64
>> ...
>> [1/3253] Linking target tests/plugin/libbb.dylib
>> ld: warning: -undefined dynamic_lookup may not work with chained fixups
>> [2/3253] Linking target tests/plugin/libinsn.dylib
>> ld: warning: -undefined dynamic_lookup may not work with chained fixups
>> [3/3253] Linking target tests/plugin/libmem.dylib
>> ld: warning: -undefined dynamic_lookup may not work with chained fixups
>> [4/3253] Linking target tests/plugin/libsyscall.dylib
>> ld: warning: -undefined dynamic_lookup may not work with chained fixups
> 
> Googling, someone suggest to use --linkopt=-Wl,-no_fixup_chains:
> https://github.com/bazelbuild/bazel/issues/16413#issuecomment-1270603343
> 
> This doesn't show up on GitLab which uses:
> 
> C compiler for the host machine: cc (clang 13.1.6 "Apple clang version 
> 13.1.6 (clang-1316.0.21.2.5)")
> C linker for the host machine: cc ld64 764
> Host machine cpu family: aarch64
> Host machine cpu: aarch64
> 
> I guess I'll just ignore these warnings.

I think this problem is tracked at:
https://gitlab.com/qemu-project/qemu/-/issues/1244

It is caused by linker flags Meson adds. For Meson, it is tracked at:
https://github.com/mesonbuild/meson/issues/10894

