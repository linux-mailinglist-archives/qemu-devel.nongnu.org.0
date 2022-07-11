Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A19B057274F
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 22:32:52 +0200 (CEST)
Received: from localhost ([::1]:36742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBMYt-0002Ln-Pd
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 16:32:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMUa-0004y2-L6; Tue, 12 Jul 2022 16:28:24 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:44957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMUY-0004pb-7A; Tue, 12 Jul 2022 16:28:24 -0400
Received: by mail-wr1-x431.google.com with SMTP id bk26so12721381wrb.11;
 Tue, 12 Jul 2022 13:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=IDYCYJSt4frMasC7+79x+7xLUOxcIa1Av1u3UPIBm0g=;
 b=qWncnOoPt07nGYdts2FH2wSHGbzI41Y6az7E3Ssxwi9x2I5jzsHT5SZ6nHxu21sqx5
 BbIkZiDYAun1zweFjSjkzl7OJZ6uRRSKjfd4xFOingXcaUs258LDEr4saP416grDXvSY
 8yGsBnkUQC+s6mOggF7/mIuqYR06RqRlgTevLF95x7MRo12GlMGbeCVyEhvvCrj3E9+j
 nLn2Sz7OP8wJ7gX5UiaXxTRRCD+ABuexkTixi4b8CJoCKNDeZJc94aRi+kovmJiVges4
 gmt7E/uZJsiUseXAA7G0sKkCQVdnDPpkX7D4FO+PI4IBe3AwxuBgtCNHnbG/6RDLAHcc
 GgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=IDYCYJSt4frMasC7+79x+7xLUOxcIa1Av1u3UPIBm0g=;
 b=gzFReOyMvLZrPNZwL/6HRpOjyd8Rp+y5nCzDrMRW+NhUVzutpmTeNr16kmtOx3Kkl1
 +U6bwVMamtL/peu5bGZf/lqrwSCky43oG9WKCcNzv7A/KHvy85ctqrL5+mJMtfRzwuky
 zIqkidqH8gvyzYRnRzxDSnsPWm97a4zF224215Rp/8M9CPHGFfHignzIZcYuMJWoPllQ
 +DIoJXa7r3SUiRIwNVKo9UrTFttMY90fVXXwNNps9z1T786NALpoyjy0qUDO81Vv2kao
 ELxVlRhhwMRVX11xYnMoObkpeEKMLG7fu3MN+rVMOMTbeO5c1MENGMRL9OF7j2LdN1jf
 Ljkw==
X-Gm-Message-State: AJIora8rdrh5bCgSLbTbQU76ufdVWw06DNr4NffcYk3UU5X+6kYYmqD2
 T+pES4hbgS0BCbw9r6ZQfjM=
X-Google-Smtp-Source: AGRyM1vQ22xy5zz2uczjUejjycRJ1WF+hC/fv8COWiVoLjLTdmBI7UhFujd1iIBbfSsEXKo9rLadwg==
X-Received: by 2002:a5d:5989:0:b0:21d:b2bd:d712 with SMTP id
 n9-20020a5d5989000000b0021db2bdd712mr5099343wri.698.1657657700666; 
 Tue, 12 Jul 2022 13:28:20 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 b17-20020adff911000000b0021d819c8f6dsm9022340wrr.39.2022.07.12.13.28.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 13:28:20 -0700 (PDT)
Message-ID: <950c757e-5d35-0c80-b9a5-c7ec3f8585dd@amsat.org>
Date: Mon, 11 Jul 2022 18:25:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: Error ret=-1 with EINTR in nbd_connect_systemd_socket_activation()
Content-Language: en-US
To: Motohiro Kawahito <JL25131@jp.ibm.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <DM6PR15MB2635A63B1B5F9F204E08BBEED5879@DM6PR15MB2635.namprd15.prod.outlook.com>
Cc: Qemu-block <qemu-block@nongnu.org>
In-Reply-To: <DM6PR15MB2635A63B1B5F9F204E08BBEED5879@DM6PR15MB2635.namprd15.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_24_48=1.34,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

Cc'ing qemu-block@

On 11/7/22 08:38, Motohiro Kawahito wrote:
> Hi, I’d like to connect to an encrypted QCOW2 file by 
> nbd_connect_systemd_socket_activation(), but I got ret=-1 with EINTR.
> 
> The arg parameter I used is
> 
> qemu-nbd --object secret,id=sec0,data=abc123 --image-opts 
> driver=qcow2,encrypt.format=luks,encrypt.key-secret=sec0,file.filename=/tmp/empty.qcow2
> 
> Can you find what a problem is? The version of qemu-nbd is
> 
> $ qemu-nbd -V
> 
> qemu-nbd 4.2.1 (Debian 1:4.2-3ubuntu6.23)
> 
> I created this encrypted QCOW2 image by the following command.
> 
> qemu-img create --object secret,id=sec0,data=abc123 -f qcow2 -o 
> encrypt.format=luks,encrypt.key-secret=sec0 /tmp/empty.qcow2 8539292672
> 
> Note that I can connect to a normal QCOW2 file by this function without 
> any error. (arg: qemu-nbd -f qcow2 /tmp/normal.qcow2)
> 


