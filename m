Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF6B5640AF
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 16:16:40 +0200 (CEST)
Received: from localhost ([::1]:38034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7dvL-0002Dk-UI
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 10:16:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o7dqj-00058u-72; Sat, 02 Jul 2022 10:11:53 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:34736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o7dqh-0004TA-Hd; Sat, 02 Jul 2022 10:11:52 -0400
Received: by mail-ej1-x62a.google.com with SMTP id d2so8839713ejy.1;
 Sat, 02 Jul 2022 07:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=33ymu/qa92JqcINgarnpPA+Wm7c0H6joEzXA1tfTgwE=;
 b=KO6UtgfYXKT00qE6Bk/BG9QaW9lq07w/GwhDYzhPX0TC3D2v7CgcLTbraRawDgrOWW
 sDvnkaK6DqEVEqWF3rjinEIDOBddBJNYKOzZ3OzZgVDNfGJsaDcxLvX/ZLzdTv9aNwIn
 qvgHkIN/kRE2RDVqUFBoFYyFYbaTZmsvMhg4St1i/PDdRUMfmFh7RVaRMLQkR8/9CJTJ
 +cnx+rRWgxBncIyBKDwXRPpixYfur5V80juSi/AWnQHIxdhOxmF/uajG3ImE+s6msLQr
 T+B5wAzIqpQUJExpBO4atAwuDgKRCtNcp63rkXEUVr2VpqNP/yj78MMNVcxECotSU917
 WBFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=33ymu/qa92JqcINgarnpPA+Wm7c0H6joEzXA1tfTgwE=;
 b=YEj0O+E9K5ZJeCApSE+z6q9WCaEhVR9ww1jsoAufnAJdHWKpF9LufIX/BmOigl8kyh
 9c+v+0y33noI19erp/NEaKad0j4rriB1aY6IZfLMVAXjRX58RGDSJvCx0VJ6N6FqWI2n
 2dobFwWkuV7cypSD90i0+3+RD+G8pE0n5rybK1R47C0OK+nbB19rsJlO9YIc6aSPo9fF
 suHvk5Evlhjh+EgAZF2+ME6/JWsKUPuFe+shXyf6W0dBRzAXwr2YWGHsO2z9auQNmc6u
 5/+6BaaS1F1BzH61oZC6NnEB5qV0YERZubW9jESxUHUMuLV6kt3LlkoHQx57IP1YoOUi
 uWWg==
X-Gm-Message-State: AJIora8ZH1ZaT4FOWJ4btDOSxGhAi5FLlBbQb/NtZbaxwbtH0YqsTl79
 Kn9hgcxf7GJF3XCauGi7PbA=
X-Google-Smtp-Source: AGRyM1trKbdTDt9OUNMs7SlybKc3N+I3TRuWmffbf0yOaRQM4W3xhK+SV1XetWAvUC1QCbiCJKK6IQ==
X-Received: by 2002:a17:906:380a:b0:722:fbf8:29a4 with SMTP id
 v10-20020a170906380a00b00722fbf829a4mr18935411ejc.139.1656771108315; 
 Sat, 02 Jul 2022 07:11:48 -0700 (PDT)
Received: from [192.168.242.248] (93-43-142-212.ip92.fastwebnet.it.
 [93.43.142.212]) by smtp.googlemail.com with ESMTPSA id
 q14-20020a1709066ace00b00722e603c39asm11853871ejs.31.2022.07.02.07.11.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jul 2022 07:11:47 -0700 (PDT)
Message-ID: <98254770-8fcf-28a6-4d6e-08eec1c7424d@redhat.com>
Date: Sat, 2 Jul 2022 16:11:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 00/10] Implement bdrv_{pread, pwrite, pwrite_sync,
 pwrite_zeroes}() using generated_co_wrapper
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Ari Sundholm <ari@tuxera.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Fam Zheng <fam@euphon.net>, Jeff Cody <codyprime@gmail.com>,
 qemu-block@nongnu.org, Vladimir Sementsov-Ogievskiy
 <v.sementsov-og@mail.ru>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
References: <20220609152744.3891847-1-afaria@redhat.com>
 <CAELaAXwNOCsrgFtxXhAvnU0RpY4p=wSedZXJ7YBf+w0usLZ5bw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAELaAXwNOCsrgFtxXhAvnU0RpY4p=wSedZXJ7YBf+w0usLZ5bw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/23/22 22:20, Alberto Faria wrote:
> On Thu, Jun 9, 2022 at 4:27 PM Alberto Faria <afaria@redhat.com> wrote:
>> Start by making the interfaces of analogous non-coroutine and coroutine
>> functions consistent with each other, then implement the non-coroutine
>> ones using generated_co_wrapper.
>>
>> For the bdrv_pwrite_sync() case, also add the missing
>> bdrv_co_pwrite_sync() function.
> 
> A gentle ping.

Stefan, Kevin, Hanna?

Paolo


