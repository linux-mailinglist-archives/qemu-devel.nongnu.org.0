Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1504D2F79
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 13:52:37 +0100 (CET)
Received: from localhost ([::1]:38966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRvnv-0003bR-Oc
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 07:52:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRvm8-0002XY-Kf; Wed, 09 Mar 2022 07:50:44 -0500
Received: from [2607:f8b0:4864:20::531] (port=35821
 helo=mail-pg1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRvm5-0006P9-E2; Wed, 09 Mar 2022 07:50:42 -0500
Received: by mail-pg1-x531.google.com with SMTP id e6so1884286pgn.2;
 Wed, 09 Mar 2022 04:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5mV86l+XlJZoY1nIjvdpuSLv3TZluZlq3bMcKdueRX0=;
 b=UzjkQWgMk0Tvcf40d32JTSN3/qADsMkVlCWSlFLH/DveMRoF22lZ5J/27Sn527Sxtn
 66xTgnkV0BTj/SuWMWjvrk5tgibXfFsbGGz8vEfBLJKAQdLoZZXDXlCjpDRWVZdFjswd
 CfUlLMBQT+NqfNTtANBkW2x5nRdADYTP5Hu+QP/VF1eZEaIQ+VcUjAvm55pfV9srm9qA
 BeAemqKeryJGaXxv2IV+qVe7Nr+QUV3X1RXOFAZ+DgjhsnxmbXXSvLZIho/ggAbTIH5I
 qc0saF9Ioq+W2sLF2gsAU+F06nEgxAWA7Za9snKZpZJlW/pONW8Rtfm1jUkjerJldUQ4
 PSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5mV86l+XlJZoY1nIjvdpuSLv3TZluZlq3bMcKdueRX0=;
 b=crBpnVaeSHVbGTdZabFJdjbVlRZ7zt/coiAsTrwAHqEhaHIfZxaZ+AXOJ+N8aH4+fR
 Brcfe/XtOh5eLskYNe4g/wqm9+5VjtUUsHy6J5Rsljljn03zse+J8i1a6zP+jzio9PSh
 iU3/wr7MFf4ifz8qlmrxyFeK2NC50uDw2gW/xlvXiSr3Nil/1AM4GWFalHbBVt0sDL4K
 ojINeR5bgrgEufZX93OvwxmvHoHfnRBIc9q6bBrkHf64wKCxYpLzkNKfFPIqFbbiYYsI
 B9RJsn2xBNJDhmOtG65VCEzvs9Z73hpzTCI6rcqdQajelHSuRB4tBYB+UBxeBjuHc+cB
 k86g==
X-Gm-Message-State: AOAM530/7AzTO3mlPEpnevq31fEfyBz4UqDQK6a6A861HzAlet0aIPf7
 3jBwJfGo8z0FcbfOmA5mF3c=
X-Google-Smtp-Source: ABdhPJxwds9VPDSCS3ccWE5Dur+Qe/Zt1nAgoYRjDnhBHYoTejWoUCC0J7O74XXrSzXpT4M5/Pvc2A==
X-Received: by 2002:a65:6805:0:b0:373:dd4e:d7a2 with SMTP id
 l5-20020a656805000000b00373dd4ed7a2mr17937626pgt.569.1646830239910; 
 Wed, 09 Mar 2022 04:50:39 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 k190-20020a633dc7000000b0037c921abb5bsm2475846pga.23.2022.03.09.04.50.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 04:50:39 -0800 (PST)
Message-ID: <ae5f9f7d-e0b3-3d79-1fe1-d8dfdb1ba2b7@gmail.com>
Date: Wed, 9 Mar 2022 13:50:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v7 22/22] gitlab-ci: Support macOS 12 via cirrus-run
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
 <20220306231753.50277-23-philippe.mathieu.daude@gmail.com>
 <f2898408-5082-7121-2496-fb296c48244d@gmail.com>
 <b05317e1-3659-2dce-4582-58bc6ca4a79b@redhat.com>
 <YiiehhaRPGWnM2Vn@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <YiiehhaRPGWnM2Vn@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::531
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x531.google.com
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
Cc: qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/3/22 13:33, Daniel P. Berrangé wrote:
> On Wed, Mar 09, 2022 at 12:58:42PM +0100, Thomas Huth wrote:

>> Basically fine for me, but can we really run additional cirrus-ci jobs by
>> default? IIRC the parallel execution of those were quite limited for the
>> free tier, so did you look close that we don't run into additional timeouts
>> yet, due to delayed cirrus-ci jobs?
> 
> You can run 2 jobs in parallel in Cirrus. Beyond that they
> get queued/serialized
> 
> We have a 1 hour job timeout.
> 
> We have to expect jobs will sometimes run slower than normal.
> 
> IOW if we have a job on Cirrus taking 30 minutes normally, we
> expect it will sometimes take 45 minutes.
> 
> All this means that if we want Cirrus to be reliable and not
> time out, we can really only have 2 jobs by default, unless
> we can get the job execution time down to around 20 minutes
> to allow for serialization.
> 
> We used to have terrible problems with cirrus timeouts when
> we were running 4 jobs concurrently (2 on staging and 2 on
> master). We addressed that in 9968de0a4a5470bd7b98dcd2fae5d5269908f16b
> by disabling the jobs on master.
> 
> IOW, we really need to choose 1 macOS job and 1 FreeBSD job
> and others need to be marked manual.

Not sure which job to choose yet. Per the first google hits we
still want to cover Catalina first:
https://www.statista.com/statistics/944559/worldwide-macos-version-market-share/

Would it be beneficial to have a 1 per OS job during PR, and
other jobs run nightly (once a day, not per PR)?

