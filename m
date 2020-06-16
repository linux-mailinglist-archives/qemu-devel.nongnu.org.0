Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA921FA957
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 09:00:37 +0200 (CEST)
Received: from localhost ([::1]:34108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jl5aG-00067z-HN
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 03:00:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jl5Os-00045V-Gr; Tue, 16 Jun 2020 02:48:50 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:34877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jl5Oq-0005vv-TH; Tue, 16 Jun 2020 02:48:50 -0400
Received: by mail-wr1-x434.google.com with SMTP id x14so19512412wrp.2;
 Mon, 15 Jun 2020 23:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IBTBkFR/YEjrp64VasvObHCtZdi9NsS/V+t+Y9ZL8J8=;
 b=AW/pHZ7bYkh80bqb5GBrA2ot+ly5QATIYRBpLR6pFTMbO6Rn6h7fZ6bJBFcdvb00vq
 lkIBO7NuJPdVNm5a1XOTTPMIIIv5rtwq6VNZPABi74dIl8MwebuUe7KkFeaWThx650PM
 tjUUPLiU/blB6hqHWr2EUOWX3Wo8cceUzGfpGyRGAf7yrE9BvozkanysunHtXeTHjJpk
 NhirUbzeQxj77C1qpu6s8Gcg/y9SuAkZzDdJ/94uBHVR4H/06IHvwCZSSrJi/34Z58jG
 zuwOf3cXoUQa6r4Ex9xUMLdvN060c+7rEtQtPPuGG3sN9s9QmWnO0/CWshWoWa3TR7mq
 tYfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IBTBkFR/YEjrp64VasvObHCtZdi9NsS/V+t+Y9ZL8J8=;
 b=Bm/fkMjv6kFnfSxqhsg8vT4m+apFTIxCh9kiBABvQmJHuXgqeIhlb8ayz2XM+Aiaxg
 YOdmMNsvmMD/FSHpRXMBAcT1CuBY3axWYIZEWVyerVCXnl3eqT296Ex7zCnUf+Qn+/Ig
 bJFYXnDH59knwyswGJcibNL+XJKri/0s3uC4tGmjXRodZ1Qblg+2Loc9M/AnrgQgF+2R
 YlYmiPDJu2zF3eGBRZtod1vcm9hNbWq8eHIDARNzu5k1+oQXJt1SeGRJkiMfu68JKRmP
 1Da8DhSKZvXOu7Hsml3Q7CRYAEzyxagG9L1PvuaaVYn3/cHEzQ8eGbU4CvqG0Y9uUzIN
 Km9Q==
X-Gm-Message-State: AOAM5333ydLEqM4wibGIgAzQgNzBsXV9OUAyrMsdPLIhO3WaQEdh4Pw0
 cgJC3Qw/c09YJZnaB+E7GGGCVTIH
X-Google-Smtp-Source: ABdhPJzMwXGMuX/mMzT0Jhr+VtD1lY2O5vOZqfNdkheiwpgw7eDnegHOyVpSCF0d69p5rB3JbxIuSA==
X-Received: by 2002:adf:ef47:: with SMTP id c7mr1475858wrp.57.1592290126386;
 Mon, 15 Jun 2020 23:48:46 -0700 (PDT)
Received: from [192.168.1.41] (181.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id z16sm27719521wrm.70.2020.06.15.23.48.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2020 23:48:45 -0700 (PDT)
Subject: Re: [PULL 16/84] macio: Put "macio-nvram" device on the macio bus
To: BALATON Zoltan <balaton@eik.bme.hu>, Markus Armbruster <armbru@redhat.com>
References: <20200615204008.3069956-1-armbru@redhat.com>
 <20200615204008.3069956-17-armbru@redhat.com>
 <alpine.BSF.2.22.395.2006152257240.23601@zero.eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8203f0bc-4cdb-a91d-38a4-2df48451204d@amsat.org>
Date: Tue, 16 Jun 2020 08:48:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <alpine.BSF.2.22.395.2006152257240.23601@zero.eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/15/20 10:58 PM, BALATON Zoltan wrote:
> On Mon, 15 Jun 2020, Markus Armbruster wrote:
>> macio_oldworld_init() creates a "macio-nvram", sysbus device, but
>> neglects to but it on a bus.
> 
> This letter   ^ is upside down :-) (but -> put).

Not sure this is the reason, but Markus is German, and I often listen
Germans pronouncing 'B' and 'P' very similar (like 'V' and 'B' in
Spain).

> 
> Regards,
> BALATON Zoltan

