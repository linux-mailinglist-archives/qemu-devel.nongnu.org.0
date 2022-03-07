Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DF44D0816
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 21:01:27 +0100 (CET)
Received: from localhost ([::1]:32922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRJXo-00043E-06
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 15:01:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRJVP-0003Jt-Vp; Mon, 07 Mar 2022 14:58:56 -0500
Received: from [2607:f8b0:4864:20::1034] (port=55154
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRJVO-0004WS-HB; Mon, 07 Mar 2022 14:58:55 -0500
Received: by mail-pj1-x1034.google.com with SMTP id b8so15040912pjb.4;
 Mon, 07 Mar 2022 11:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=D3QFA/1FETmMKrKC+k0dq2nd+X/whf8ELCJn/tLr7G8=;
 b=M3Kq+HbhkNVXDsCq4ZEWswE3TxsFjC4pF/t0UJk+tPAnTG/LptyugZECrwRzAf1XEy
 LGbgx89MaOkhjyX3F8rsw+mYKD0D5JAHVnCTq6mFwr1hyXxcT6qx+b3zv2tRQtYXn/tp
 tu/Qb5aKujk7FrbB+cxvof137zgYMiG5XjClkdZinOVtn79nXd6MMT7uGxOAqyVjcQ0K
 j8DFFajlZr8hh5uNpUZ7IHAEqJmGyqRjPyM2x7vrTIhJLGcmsvP7U58Jy//o694x8aV4
 iKTzWucBgIvLA6NHgeEZIepV5qttjzCetjl8glx5mSqdvoaRuTqMjlUr0wEUmdH4W/i5
 oF3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=D3QFA/1FETmMKrKC+k0dq2nd+X/whf8ELCJn/tLr7G8=;
 b=BdKebDLup2aNB1aw4VWzIASUgzErC5zztX3WUuTHkW/GAdBSQ2NgjWq8a2A9NKibCE
 yDoDQzXoxlCNsEDVQm3SV6qVaCXAVRKz1cP5mmll7wnAX3SwiW7A0kQt04rFA4h2cMb0
 tBM16UjaAYTsm98c/FDl8Nszx/OH+zzbuVx/NONxHFAvwCeHtVT4ylvD54C0GvIveVY4
 Cyp+ityesngwpmEmBquIj2uwfLGuCQUEScT8tHAO7YjFn9t12HN2Wh06RK96hnkGEXRX
 VPZacfp4oJHLU5eVT8rZkWv08hv8pcRs+2RjpH8YY5JaDMOFJRQ/8hGIdyxnIyyY8cE2
 DEyQ==
X-Gm-Message-State: AOAM530n+uBcx1kQRbuhmhvVINVLZrfeTnxh9T+GEPY2kt0hLO63etAx
 maQpA1ZyRW68Db+bybsZ/3w=
X-Google-Smtp-Source: ABdhPJzo05MDbN8Oj4G6xz6YhXO+BkpXH7OIT5eSjgxJ1fu1zues4dXGUvxCPmcYQMlXIpICJFK6hw==
X-Received: by 2002:a17:902:f785:b0:14d:d2b6:b7c with SMTP id
 q5-20020a170902f78500b0014dd2b60b7cmr13679406pln.68.1646683132162; 
 Mon, 07 Mar 2022 11:58:52 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a637a47000000b003803fbcc005sm4234847pgn.59.2022.03.07.11.58.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 11:58:51 -0800 (PST)
Message-ID: <7504d4c4-e1cf-999e-6c00-9638a5d559ac@gmail.com>
Date: Mon, 7 Mar 2022 20:58:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 0/9] add LOG_UNSUPP log type + mark hcalls as unsupp
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20220307191553.429236-1-danielhb413@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220307191553.429236-1-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1034.google.com
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
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/3/22 20:15, Daniel Henrique Barboza wrote:
> Hi,
> 
> I got a lot of noise trying to debug an AIX guest in a pseries machine when running with
> '-d unimp'. The reason is that there is no distinction between features
> (in my case, hypercalls) that are unimplemented because we never considered,
> versus features that we made a design choice not to implement.
> 
> This series adds a new log type, LOG_UNSUPP, as a way to filter the
> second case. After changing the log level of existing unsupported
> pseries hypercalls, -d unimp was reporting just the ones that I need to
> worry about and decide whether we should implement it or mark as
> unsupported in our model. After this series there's still one hypercall
> thgat is being thrown by AIX. We'll deal with that another day.

Why not simply use a trace_spapr_hcall_unsupported() event?

Then you can filter using '-trace spapr_hcall_unsupported'.

