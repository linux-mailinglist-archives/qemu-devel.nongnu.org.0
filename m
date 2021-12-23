Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F7F47E0B6
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 10:07:42 +0100 (CET)
Received: from localhost ([::1]:52780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0K4a-0000Rn-MH
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 04:07:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0K2Y-0007pJ-Qp
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 04:05:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0K2S-00066o-JH
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 04:05:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640250326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aPW0D74pqkekSNSMMxGsdUF5/VOcFtHL0dgOkeGSeTg=;
 b=cuo8QHl7m5ylENJvfycCt31/M/+VnFg2Sex4bdWDilsVaPRxyt42EGFTIqLwlLzPahWtAB
 gb34RaUvILhV1sUYmGj7DYhB6MjL8tjs7zu4FhyGi1anJFo62Mjm659QCORX1SJwd3kTAI
 BwDlhn4s8oMoiJtogPbg1LOzflmAGH0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-KZJSJeb9N_--g9ng_Ei5yQ-1; Thu, 23 Dec 2021 04:05:25 -0500
X-MC-Unique: KZJSJeb9N_--g9ng_Ei5yQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 v23-20020a05600c215700b0034566adb612so1770417wml.0
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 01:05:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aPW0D74pqkekSNSMMxGsdUF5/VOcFtHL0dgOkeGSeTg=;
 b=8M3CeYy2C4+j5UpGNZQUXpvLgqRl8hK6cgqFRp76crzUagB1H/wk1ptnPkeSCzATN4
 PhF3I3Nsw4Ndcyd8ENzcaL/sGSUdai38rmZ5b8aiiY3m1ZANK479oj8lf2ZBVNHDVL50
 zySZo1dsjhLg2C8fYVrlLfUIeS0bWlng+QzryFJkoqnOcsHTWrd6ApfmqD8taloDziVC
 ajv3GqFwZO00Dnpxk8DwCrVEFIMoq1p9Hf6E8u9ZZGnV5MN+117bI7BX0ewM+9eN6kQW
 75J/+Zb6vq9e0NDmyf1cW2o0QotuPBMAtKlgmEph+/bpXI3Bz4vU6KKqXmT0sqR7aEi5
 BPVA==
X-Gm-Message-State: AOAM53167ZHFJQ9ny15GSBr5ASrsgLB8SU2MHsczcNZvCk0xfaBAbA58
 48/kINQClj1XJtoMBu9S5IA1sjqEgFN0ShJfnTzZ39ASayAkLZ3Y1x88RpNHPC5rJpk5lw97XjW
 HgiHiOF8eG0XsJas=
X-Received: by 2002:adf:aa9d:: with SMTP id h29mr1021153wrc.120.1640250324077; 
 Thu, 23 Dec 2021 01:05:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzgZsHCZxLSMN92t+zqo/+Ai3nqkd6ikL2AeI6cPdQ1Gj0BcW/fP+IOLxC0xv3B2Q8PqPZV5A==
X-Received: by 2002:adf:aa9d:: with SMTP id h29mr1021139wrc.120.1640250323860; 
 Thu, 23 Dec 2021 01:05:23 -0800 (PST)
Received: from [192.168.43.238] (33.red-193-152-124.dynamicip.rima-tde.net.
 [193.152.124.33])
 by smtp.gmail.com with ESMTPSA id q8sm4315178wrx.59.2021.12.23.01.05.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Dec 2021 01:05:23 -0800 (PST)
Message-ID: <1f2ee350-fba4-40f1-7001-7212ab63d860@redhat.com>
Date: Thu, 23 Dec 2021 07:50:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/3] scripts/qapi-gen.py: add --add-trace-points option
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20211221193502.114296-1-vsementsov@virtuozzo.com>
 <20211221193502.114296-3-vsementsov@virtuozzo.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211221193502.114296-3-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.264, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: michael.roth@amd.com, armbru@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/21/21 20:35, Vladimir Sementsov-Ogievskiy wrote:
> Add and option to generate trace points. We should generate both trace
> points and trace-events files for further trace point code generation.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  scripts/qapi/gen.py  | 13 ++++++++++---
>  scripts/qapi/main.py | 10 +++++++---
>  2 files changed, 17 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


