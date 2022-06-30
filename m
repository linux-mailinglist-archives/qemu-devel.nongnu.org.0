Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E16885615D0
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 11:15:12 +0200 (CEST)
Received: from localhost ([::1]:53612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6qGV-0004iS-DF
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 05:15:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1o6qDs-0003uf-Eg
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 05:12:28 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:44737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1o6qDi-0002m8-4H
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 05:12:22 -0400
Received: by mail-pg1-x530.google.com with SMTP id v126so13739853pgv.11
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 02:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=JBK2ew8w4fb0WH1fZDY1OBafVj78Elk6yGd4b6MvfGA=;
 b=ZM9tFJ46G6zS8y8NHbKH3e30u9Jm1zcNTFZF+xFQ6Hq5lPtL7r5Lq9OFcxVuf+v1+6
 iiVt+Xz37KT8r+KXBjUCjTahVLJasCSlxVrxNyOhQsmOk+rcfWbJOPQ0h9eEgiawbbz4
 7GKtgg/dFeMNq/rmNwLC4BI+KV8jQxr3qLUxcNAtEPqzup8VbHD5j1ww3MDPKyF54E45
 Q5+smdHVvddWGBlJJ+UfAGpTr+JDT1TQ+DdKDSaWK6oYrCKrn2wgM5KOrZX79NuRtC+s
 c15j/Oin000bOdEmtdLaM6ikTT/5WkPz9QXzSmChg5UIlHb6y2pfGev2yKCSgnNNNy2g
 1ZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=JBK2ew8w4fb0WH1fZDY1OBafVj78Elk6yGd4b6MvfGA=;
 b=WQvv9kXBWEszbb8DvZBYW2+KVAim2UmbFsu+Jy6r4pmnElZHs/E31VoIiSjzIZW1PR
 HMW6boyqYcSecycNsMMMP45z+LiktM5HtYxwYbTP474EaLdJgJD7Sf+C9nU+O1U8a2Aw
 ZZvg/+nh6YXcruveF3eczh94G0OD9tbVognCkmWsJzVgB1gY2IrJAV1rNNl/3iWWtAbp
 s3Abt/d1Zfa3bpNmSlh20MD/VGt6bY1RSOAYU0x6rCXNyVonspNmAEZ+arsdojWT7Yc1
 8dQvVbz4JlkHe/+NM0Ec8AAU3Ik81rI58vEcF2iHsXuegY0cp/GVYr2hIeY+kcBn+TFl
 hTrg==
X-Gm-Message-State: AJIora/GYBeNwZXfIVxjlRNaXr3/WK80hug+WM6Jatmr6ALeHWDyFdsX
 J+d+X6nglaTrZtJ2+GEYXmCccPFUsPB08g==
X-Google-Smtp-Source: AGRyM1vJqeQOwz+T7dTLqC9zULEryZ5pPEbSWXAVLnidjifhbEiKQJWL1P52VXQAWRS095rsldk4Tw==
X-Received: by 2002:a63:7785:0:b0:40c:c07d:6c21 with SMTP id
 s127-20020a637785000000b0040cc07d6c21mr6882454pgc.7.1656580335404; 
 Thu, 30 Jun 2022 02:12:15 -0700 (PDT)
Received: from [10.76.43.148] ([61.120.150.78])
 by smtp.gmail.com with ESMTPSA id
 j8-20020a17090a318800b001ed2fae2271sm1306035pjb.31.2022.06.30.02.12.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Jun 2022 02:12:15 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: PING: [PATCH v2 0/7] crypto: Introduce ECDSA algorithm
From: Lei He <helei.sig11@bytedance.com>
In-Reply-To: <20220622091549.31115-1-helei.sig11@bytedance.com>
Date: Thu, 30 Jun 2022 17:12:09 +0800
Cc: Lei He <helei.sig11@bytedance.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 pizhenwei@bytedance.com, jasowang@redhat.com
Content-Transfer-Encoding: 7bit
Message-Id: <64637D04-E31E-4C90-9E17-BA598A8FB2A2@bytedance.com>
References: <20220622091549.31115-1-helei.sig11@bytedance.com>
To: qemu-devel <qemu-devel@nongnu.org>,
 =?utf-8?Q?=22Daniel_P_=2E_Berrang=C3=A9=22?= <berrange@redhat.com>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=helei.sig11@bytedance.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

> On Jun 22, 2022, at 5:15 PM, Lei He <helei.sig11@bytedance.com> wrote:
> 
> This patch introduced ECDSA algorithm for crypto.
> 
> V1 -> V2:
> - The reserved function prefix '_' is no longer used.
> - When parsing ECDSA key: 1) set errp as early as possible,
> 2) use g_autoptr to avoid manually freeing memory, 3) simplified the
> code parsing public key for gcrypt.
> - When parsing the ECDSA private key, save the public key 
> info (if any) so that the private key can also be used for
> verification.
> - Fixed a bug, gcrypt-ecdsa can truncate digest correctly now,
> and a related unit-test is added.
> - Fixed a bug, nettle-ecdsa can correctly add leading-zero (if needed)
> when encoding the signature now.
> - Minor tweaks to code style and typo fix.
> 
> V1:
> - make the built-in ASN.1 decoder support more ASN.1 types.
> - support ECDSA key and signature parsing.
> - implement the ECDSA algorithm using nettle and gcrypt respectively.
> 

Ping for:
<https://patchew.org/QEMU/20220622091549.31115-1-helei.sig11@bytedance.com/>.

