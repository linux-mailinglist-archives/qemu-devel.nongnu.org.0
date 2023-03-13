Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FDD6B7253
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 10:17:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbeIO-0007Dd-Ta; Mon, 13 Mar 2023 05:16:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pbeIL-0007DG-RB
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 05:16:41 -0400
Received: from esa3.hc2706-39.iphmx.com ([68.232.154.118])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pbeIK-0001OD-9h
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 05:16:41 -0400
X-IronPort-RemoteIP: 209.85.219.71
X-IronPort-MID: 264210044
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ekknpKqAT2ft8FTzwmlmYcnq5+9eBmKlZxIvgKrLsJaIsI4StFCzt
 garIBmFOfuKMGehftsiaomw90lTvJHQydc3G1durX9jRSMXpZacVYWSI3mrAy7DdceroGCLT
 ik9hnssCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UMHUMja4mtC5QRlPKsT5jcyqlFOZH4hDfDpR5fHatQMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+AsBOsDAbzsAB+v9T2M4nVKtio27hc+ada
 Tl6ncfYpQ8BZsUgkQmGOvVSO3gW0aZuodcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwyvhsAzpx9
 PMhDiFSMA29ovjrg5/kVbw57igjBJGD0II3v3hhyXTAE69jT8+aBarN4tBc0XE7gcUm8fT2P
 ZJIL2oyKk6ZMlsQYz/7C7pn9AusrnD7YztUsnqfuOw673W7IAlZiuaxaoONIoDWLSlTtmO6v
 nvor32oOBNADdnAkBa63XKqvfCayEsXX6pXTtVU7MVCmVCW2ykfBQMbUXO9pv+2jFP4XMhQQ
 3H44QIrpKk2sVW1F5zzAET+r3mDsRoRHdFXFoXW9T2w90Yd2C7BbkBsc9KLQIVOWBMeLdDy6
 mK0og==
IronPort-HdrOrdr: A9a23:N85n9Kw+U3ZKWtrZ41ZHKrPw+r1zdoMgy1knxilNoNJuA6ulfu
 SV7YkmPH7P+UwssRQb8+xoV5PwI080maQFhLX5eI3SIDUO21HYV72Kj7GSugEIcheWnoUttp
 uIMZIOcOEYZWIbsS+Q2njfLz9P+qjizImYwc3z9TNCdz1LVo1XxztFK2+gYzJLrcp9aabR1q
 Dw2iOKnVSdkL0sAaWGOkU=
Received: from mail-qv1-f71.google.com ([209.85.219.71])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Mar 2023 05:16:38 -0400
Received: by mail-qv1-f71.google.com with SMTP id
 y3-20020a0cec03000000b0056ee5b123bbso6738093qvo.7
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 02:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1678698997;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4WPaze0h9AMn2SCsPUA9IEGbFr5W04RIRpws0eq0cpA=;
 b=B1DMFw+I476kJ/pFPTa6l2c67zH8F0ZlCIW59OTrNIdYrdgkQ2YizuDCjr+G55eRO5
 Q3hmk/3kpkIZEj0ScFczOiwIRKkKRsARP9PClE/bhxkJuj+/HhMcr1l/2s5npdJItVex
 12sVwd3D6Bg6SqXCxJh2TsP9K27YQ9aM/XgqC4zY+HJ332i0YHByxwiaZrIx1V8tDqWS
 IDk2Z1SB2y3wZnk6VHif2/eGRhDmjMmG7VCy0S7jdTVAk7QRYLvl6IEwruRMys7itiAu
 jTeZQeo6P/GCwecrJWI0+sFy7UnHWvnX9Se8ZxCXu2q8uFxUKNIqjMq2I8djrYk3Wp1y
 DaHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678698998;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4WPaze0h9AMn2SCsPUA9IEGbFr5W04RIRpws0eq0cpA=;
 b=l/nVYU3FZSCwciiG21iQ6ooye5eH2i47BAJdJJqcaq8KenPSpjO+0Hk2Xz6WZm7wDK
 fsoWtzb7NdhIV1ShF7ia3bXxSFxrxCPenJ97AV9HgsaHOUEFhCudQvN4d0XJSpvv/32b
 i60tTughQkYgsNGlTa96cdLLb0RAxo/XbGHY0glqiGrK5jupGgCU7eCNh1mHfO3tg430
 vPGUw6XI4q41P0jjpcoBWX3tp6sVvRTVKZGu31G6aRkv16qch6m6Huy9gcqGCw5azjq4
 5giC9vnSJ+YVg2EzYitf6LMozV4cbxWXUe6iQRuckCu3WdgfJzFLgQLjsM2ZEDMmuWKL
 L17w==
X-Gm-Message-State: AO0yUKWYn5FKTcWMxJ3Uimj+pl3Wx9tjEzSqHmi8QhiTMwJsS265I1mV
 V34+3fk8307U9m4CwzNuQW9wHqIdwSTar8wW/lF0JcR9QXoFJZgNuhrzbItzQ80L+nylEeq1qum
 dtyPN4S0Gat6djtRIrZzux2chwiD0QA==
X-Received: by 2002:ac8:570e:0:b0:3bf:d6da:e58d with SMTP id
 14-20020ac8570e000000b003bfd6dae58dmr55859554qtw.54.1678698997731; 
 Mon, 13 Mar 2023 02:16:37 -0700 (PDT)
X-Google-Smtp-Source: AK7set8qnctN76pQB0RsXVnTjs/3JvmhH3srwJpiDD9wN+/oGA34TSZlC1wFjUkHaOvHWNf0OviFAA==
X-Received: by 2002:ac8:570e:0:b0:3bf:d6da:e58d with SMTP id
 14-20020ac8570e000000b003bfd6dae58dmr55859518qtw.54.1678698997451; 
 Mon, 13 Mar 2023 02:16:37 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a05620a148800b007449a3ee9a4sm289026qkj.35.2023.03.13.02.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Mar 2023 02:16:36 -0700 (PDT)
Date: Mon, 13 Mar 2023 05:16:33 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Jon Maloy <jmaloy@redhat.com>, Siqi Chen <coc.cyqh@gmail.com>
Subject: Re: [PATCH v7 1/6] memory: prevent dma-reentracy issues
Message-ID: <20230313091633.ehngz7egif4tmwwi@mozz.bu.edu>
References: <20230313082417.827484-1-alxndr@bu.edu>
 <20230313082417.827484-2-alxndr@bu.edu>
 <bb13d933-0de9-9537-8e3e-dc91c24eb177@linaro.org>
 <20230313091500.pazvdnqbcyuxs5yw@mozz.bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230313091500.pazvdnqbcyuxs5yw@mozz.bu.edu>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=68.232.154.118; envelope-from=alxndr@bu.edu;
 helo=esa3.hc2706-39.iphmx.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 230313 0515, Alexander Bulekov wrote:
> > 
> > At this point I'm not sure anymore this is a device or MR property.
> 
> It's designed to be an MR property. If it were MR specific, it wouldn't

Should be "It's designed to be a Device property."

