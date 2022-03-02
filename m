Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8818B4CAC44
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 18:39:24 +0100 (CET)
Received: from localhost ([::1]:48068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPSwd-0002ai-8U
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 12:39:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nPSva-0001iO-F8; Wed, 02 Mar 2022 12:38:18 -0500
Received: from [2607:f8b0:4864:20::62d] (port=46738
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nPSvY-0005fc-Td; Wed, 02 Mar 2022 12:38:18 -0500
Received: by mail-pl1-x62d.google.com with SMTP id bd1so2153131plb.13;
 Wed, 02 Mar 2022 09:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WH0+qyWWHhV8of3aAofph+MQPHfJdu4kz/EMF0WIztU=;
 b=PulbCMbgEH+38j2aU0QpcfPYU0SWGN7ngqaEhoEo5kxg50T0PSDoRmsQUgBOjOld/F
 YxlyeRlpG7MJ0kEg2syixXQf9NfJuLU2Q1zOhr/jxtI85g0rTBu4qV6aXyKTbH2rhplI
 9oM6yqy84EZ6z1KyX3vRQxUjhlvtEJVqSfkx0UdUCbn20Yc3mutuWNmErlWiEqBxhWDG
 x7t/AzA4UbAo+SXThaaWMJXZeeFHs+Qqgp/9bQFgxk+VVWxhXzDphaBiSB7HoQ5l7NNs
 VohhbA+vhlCRLrJ9SL5+8CJ9aSnFeu43IJdTbtqHqgwolYA1ZWDd07HuzzhOM9RFkP02
 G/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WH0+qyWWHhV8of3aAofph+MQPHfJdu4kz/EMF0WIztU=;
 b=vC2uiD6hLYreb/AyqD4esm2i143twWEEd4nfRqNG9GG3ZyWAdOR2rr5CtIBqjeFd4X
 ACTod1IqGFyJ9pWLgnRx+VMQpmDrRykZjF0U5KswOlgzuJGpwZMnzJpj9G5v/dSZHD4v
 sVjgs/RcxC2pQNsZbzZU2mrkSRQ5n7lMXNsRCaQi4w/scr/+RRnfHP1CNzkxoQ3ggYm0
 VhY6iwIcYshhUtz7eWCuqnpc+podahkgFNC/4A7HuiI1G3gYA/u3MJzRff4iXbGKvKpU
 nj2T/mSMHWo4joqUhIG+IpJKVdU8pXkN1JdSvV1nfkSwapZwVG94LmBRBMhQOnEcw2PD
 Nulg==
X-Gm-Message-State: AOAM5307lODyJHnNdb1vTg2176U9tP2IiSXKWjc4cXvapZ9o7rikYm9T
 GYg3XdkKJ0yiVhInQdZGFS0=
X-Google-Smtp-Source: ABdhPJx8K6gIn+cvPLthAImu2ZgCGqli+P0GJq859CmenB64iJaGRgs6Pw6TtxmdQDtyQMKV41EZ1g==
X-Received: by 2002:a17:90a:4e:b0:1bd:36ce:8150 with SMTP id
 14-20020a17090a004e00b001bd36ce8150mr925058pjb.62.1646242694886; 
 Wed, 02 Mar 2022 09:38:14 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 y16-20020a056a00191000b004e155b2623bsm22513286pfi.178.2022.03.02.09.38.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Mar 2022 09:38:14 -0800 (PST)
Message-ID: <85ed0856-308a-7774-a751-b20588f3d9cd@gmail.com>
Date: Wed, 2 Mar 2022 18:38:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 2/2] Allow building vhost-user in BSD
Content-Language: en-US
To: Sergio Lopez <slp@redhat.com>
References: <20220302113644.43717-1-slp@redhat.com>
 <20220302113644.43717-3-slp@redhat.com>
 <66b68bcc-8d7e-a5f7-5e6c-b2d20c26ab01@redhat.com>
 <8dfc9854-4d59-0759-88d0-d502ae7c552f@gmail.com>
 <20220302173009.26auqvy4t4rx74td@mhamilton>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220302173009.26auqvy4t4rx74td@mhamilton>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62d.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, vgoyal@redhat.com,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 John G Johnson <john.g.johnson@oracle.com>, Cornelia Huck <cohuck@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/22 18:31, Sergio Lopez wrote:
> On Wed, Mar 02, 2022 at 06:18:59PM +0100, Philippe Mathieu-Daudé wrote:
>> On 2/3/22 18:10, Paolo Bonzini wrote:
>>> On 3/2/22 12:36, Sergio Lopez wrote:
>>>> With the possibility of using pipefd as a replacement on operating
>>>> systems that doesn't support eventfd, vhost-user can also work on BSD
>>>> systems.
>>>>
>>>> This change allows enabling vhost-user on BSD platforms too and
>>>> makes libvhost_user (which still depends on eventfd) a linux-only
>>>> feature.
>>>>
>>>> Signed-off-by: Sergio Lopez <slp@redhat.com>
>>>
>>> I would just check for !windows.
>>
>> What about Darwin / Haiku / Illumnos?
> 
> It should work on every system providing pipe() or pipe2(), so I guess
> Paolo's right, every platform except Windows. FWIW, I already tested
> it with Darwin.

Wow, nice.

So maybe simply check for pipe/pipe2 rather than !windows?

