Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B11A7490851
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 13:09:55 +0100 (CET)
Received: from localhost ([::1]:59796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Qpe-0004jX-Aw
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 07:09:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n9Qlm-000244-R3
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 07:05:54 -0500
Received: from [2a00:1450:4864:20::335] (port=37757
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n9QlS-0003ZT-NR
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 07:05:54 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso23816675wmj.2
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 04:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6DhulN/T6buC+GwiIXobHDOp4CrzAFYXib0SWZTaiQo=;
 b=P5CDjqwBF3sKGo+yn5XfgbeBRcDyg6LntzhVP5AisLLnSEQgvTw4CORB9Qcei2YjT4
 IemAeKfF0/TezVD4hAdo5gQLHqG3SIE4wRjrrG7Lpgf7EfKYM+PgyL0E0iRdEAp71Bqo
 /PcTTy0w0Mw/7Tcu71ILQHGcbZlvM5uMhJ9duxbFHCcxBd9McfOxYEogzVDiXe77YTlA
 futL3raZyK/eTZ04HYzezoeia4xfvkHlVIy3eiAPLwp5SHypThCP1UDgl6OcaI6bIxoJ
 KNRAo4WC2+ByCq63E9+mxaTML7Zu/n3EBu6S0EDlHbyCfOd93+zqvz+SrZMYI68TDgi4
 VkxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6DhulN/T6buC+GwiIXobHDOp4CrzAFYXib0SWZTaiQo=;
 b=qKkTFNP/FYbw2WpYWZyJyE3lMRyFbRN9mF105eJHGK8s04arqvTPNZkiJmCu9H/zhv
 errS9yeq8k/dbn2IL33Js5VQSweI3WjjJHMbcJl6ratNUKO7IgKHr7WEdW98xIcdUNPI
 V7WrQVHLf7XJhTasBoFK0eExoIR5+MzXRP+u0TvoGys/RQgBk+7pQ+MDfDJkJE8acZ5I
 YeAsNANRlpxmEB3Egyn0TcGapvFklyGMozD/iIkGDemeRDwpTJezf8zKvzF9eBwz6ceQ
 uk6yovTAqBWVGbGCXSoF9/fieVsRouxS53evGyAz/wuh2B6w1Fu8RQHiW+VH5w/SttuQ
 BTYA==
X-Gm-Message-State: AOAM533sC0lilknZZK7QvuQ57rr4DUGUyzOqkp7r9ziCQTAXYVTpMdhx
 rfi5O+H9gakAID8QxRW3zj8=
X-Google-Smtp-Source: ABdhPJzb/B7M+vgTcEdC0frCOe0EDhsEObQ4WSxpjhx6obd5/onqn6lJIzUQkW/XIbsD1qCzFupduw==
X-Received: by 2002:a7b:cb01:: with SMTP id u1mr20007951wmj.187.1642421114640; 
 Mon, 17 Jan 2022 04:05:14 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id l6sm17954335wmq.22.2022.01.17.04.05.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 04:05:14 -0800 (PST)
Message-ID: <ee0d6990-06f3-9a1b-f7d5-7c379f0e9773@redhat.com>
Date: Mon, 17 Jan 2022 13:05:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 1/3] qmp: Support for querying stats
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Mark Kanda <mark.kanda@oracle.com>
References: <20211119195153.11815-1-mark.kanda@oracle.com>
 <20211119195153.11815-2-mark.kanda@oracle.com> <Ya+rLex1djU/1Wc1@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Ya+rLex1djU/1Wc1@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/21 19:42, Daniel P. Berrangé wrote:
> Now onto the values being reported. AFAICT from the kernel
> docs, for all the types of data it currently reports
> (cumulative, instant, peak, none), there is only ever going
> to be a single value. I assume the ability to report multiple
> values is future proofing for a later requirement.

Yes, in fact histogram values have since been added.

> Second, for a given named statistic, AFAICT, the data type,
> unit, base and exponent are all fixed. I don't see a reason
> for us to be reporting that information every time we call
> 'query-stats'. Just report the name + value(s).  Apps that
> want a specific named stat won't care about the dimensions,
> because they'll already know what the value means.

I agree on this.

> The 'name' and 'type' are used for filtering I presume. Only allowing
> a single value for each feels pretty inflexible. I'd say we want to
> allow mutliple requests at a time for efficiency.
> 
> Bearing in mind my other suggestions above, I'd think we should have
> something  more like
> 
>   { 'enum': 'StatsProvider',
>     'data': ["kvm", "qemu", "tcg", ....],
>   }
> 
>   { 'struct': 'StatsRequest',
>     'data': {
>        'provider': 'StatsProvider',
>        // If omitted, report everything for this provider
>        '*fields': [ 'str' ]

I think provider should be optional as well.  See below.

>     }
>   }
> 
>   { 'struct': 'StatsVCPURequest',
>     'base': 'StatsRequest',
>     'data': {
>       // To request subset of vCPUs e.g.
>       //  "cpu_set": "0-3"
>       // Could use ['int'] instead if desired
>       '*cpu_set': str,

Yes, ['int'] is preferrable.

>     },
>   }
> 
>   { 'struct': 'StatsFilter',
>     'data': {
>       // If omitted means don't report that group of data
>       '*vcpu': 'StatsVCPURequest',
>       '*vm': 'StatsRequest',
>     },
>   }

I agree except that I think this and StatsResults should be unions, even 
if it means running multiple query-stats commands.  There should also be 
an enum ['vcpu', 'vm'] that acts as the discriminator for both 
StatsFilter and StatsResults:

  { 'enum': 'StatsTarget',
    'data': [ 'vcpu', 'vm' ] }

  { 'union': 'StatsFilter',
    'base': { 'target': 'StatsTarget', '*providers': ['StatsProvider'] },
    'discriminator': 'target',
    'data': { 'vcpu': ['*cpu-set': ['int']] }
}

  { 'union': 'StatsResults',
    'base': { 'target': 'StatsTarget', stats: ['StatsResultsEntry'] },
    'discriminator': 'target',
    'data': { 'vcpu': ['id': 'int'] }
}

Alternatively, the providers should simply be keys in the dictionary

Paolo

> 
>   { 'alternate': 'StatsValue',
>     'data': { 'scalar': 'int64',
>               'list': [ 'int64 ' ] }
>   }
> 
>   { 'struct': 'StatsResultsEntry',
>     'data': {
>       'provider': 'StatsProvider',
>       'stats': [ 'StatsValue' ]
>     }
>   }
> 
>   { 'struct': 'StatsResults':
>     'data': {
>       '*vcpu': [ [ 'StatsResultsEntry' ] ],
>       '*vm': [ 'StatsResultsEntry' ]
>     }
>   }
> 
>   { 'command': 'query-stats',
>     'data': { 'filter': '*StatsFilter' },
>     'returns': 'StatsResults' }

