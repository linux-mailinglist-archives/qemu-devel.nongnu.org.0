Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C814D6938
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 20:53:37 +0100 (CET)
Received: from localhost ([::1]:54744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSlKT-0003wv-16
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 14:53:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSlIK-0002Zu-4t
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 14:51:25 -0500
Received: from [2607:f8b0:4864:20::435] (port=46074
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSlII-0002Gw-Mc
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 14:51:23 -0500
Received: by mail-pf1-x435.google.com with SMTP id s8so8707836pfk.12
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 11:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=aB8NoQvx/1f92SaRJOFdmvA+I5StzZxTWRQyRpNVcpM=;
 b=TuTTk5mfsZj5IfCs0ahdotnc6vfpN+VOybsRhsQwNuFWpMPVwIWbOfqAIWgIHmRJjw
 m2DvzLs0aRJKPeuWpSHsxPxsJX+/qgEYmt3otx4ae4vtPmpthb9YecH4PTy7HSYbSxEr
 fH+NB2/KFOQjNzSd3kb2vMBui2COnkQ0ip6sEZx8mZbdLhhkUj/YunlKqzdhBqbCB776
 hrK2jw+Qz3FXMhtUZKy7NHpAw5Em+WRo//twP7i4P4pRhJ8DMy/cf3GB8Jo6KfJms0ep
 ZVi6DnTR96Dpy6jK9Jj9QQkyoKD+m6V8PDPVI6WF49NefYyFq9HADFGFb9KUIih78vHN
 ZfGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aB8NoQvx/1f92SaRJOFdmvA+I5StzZxTWRQyRpNVcpM=;
 b=bCnunZTehNn8L8U67pl2mLCB9t94sHZfRFGHgpqcW4GJHr+rn6MnPeCO/ecDByUfvt
 A8sxUNfvS2r61Ex1LgJNemenmN8wyVaR69S/isQDffqwr9v9pF0Yd8KccXtNNthg+MCC
 ujatgqIcw8K7rmMl2US7JPQ9FnNY2EeNa2X4em7ZN6E+7yK7RmigG8WOC7vzyZv0Xdex
 UoAZxGocMavLDoWHtpn9X+37xxMJPOOMGeNmo41Lv/9aDU5AuNgyF1JYk/xLHk6rcd9L
 7E4QPkMqS009B+W2I5l12+UKW0PWc15A6YGv94RXU9UpLeMHUC5cj67Z8bE0jVP+bTAh
 ysVA==
X-Gm-Message-State: AOAM531KcaX8IYHBucuXI3W43qPW52N9c0xpne/gLCrZXfzAnw/OegPc
 xA6xa2wEvSiOePHOMv3sIbuuDA==
X-Google-Smtp-Source: ABdhPJyDX3G7kOXICojcgxlKlkIA20iBrpQOAW3ssU/q/xEFQUg2agD/jYrmgeiTS7kyq6GyJbTRsQ==
X-Received: by 2002:a63:d1e:0:b0:372:c1cd:9e16 with SMTP id
 c30-20020a630d1e000000b00372c1cd9e16mr9645720pgl.421.1647028281352; 
 Fri, 11 Mar 2022 11:51:21 -0800 (PST)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a056a000b8d00b004f75395b2b4sm11428331pfj.55.2022.03.11.11.51.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Mar 2022 11:51:20 -0800 (PST)
Message-ID: <927eef68-c85b-c483-c107-b9d1a9dbc453@linaro.org>
Date: Fri, 11 Mar 2022 11:51:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 8/9] dump: Cleanup dump_begin write functions
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
References: <20220310110854.2701-1-frankja@linux.ibm.com>
 <20220310110854.2701-9-frankja@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220310110854.2701-9-frankja@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/22 03:08, Janosch Frank wrote:
> There's no need to have a gigantic if in there let's move the elf
> 32/64 bit logic into the section, segment or note code.
> 
> Signed-off-by: Janosch Frank<frankja@linux.ibm.com>
> ---
>   dump/dump.c | 42 +++++++++++-------------------------------
>   1 file changed, 11 insertions(+), 31 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

