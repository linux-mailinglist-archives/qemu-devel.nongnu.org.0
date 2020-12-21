Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2CF2DF88A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 06:13:54 +0100 (CET)
Received: from localhost ([::1]:38864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krDW5-0004Un-Ve
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 00:13:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1krDV1-000464-Th
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 00:12:47 -0500
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:42840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1krDV0-0006V4-5b
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 00:12:47 -0500
Received: by mail-oi1-x230.google.com with SMTP id l200so10144171oig.9
 for <qemu-devel@nongnu.org>; Sun, 20 Dec 2020 21:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:to:cc:from:subject:autocrypt:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=sckBll5EIRKG8pKqjRpKKS0dDw5aO9GxSUjaykXzPao=;
 b=JLGzIRsxrGKyHYvF3l/tc297CoQjeK9pQ3dstHUrkeWibkAUt2DqdV9MRV890cYM0L
 dAvGLoSm3EYe+S2vqwh1XPJbg57mWJKG1A/P4ZQaI0K9A2pvSmvjJevV5j+RO0rDGXMU
 6ydAsqk+SsFUgPcIBTC1mMcFgWXsgxi8TZ9jjFJL2I9tG5nc9rcj5uZc779GSIJkIGQK
 +XawJJrLoXHP+MEYz7epwGFCaYm1dJBwuxk/WkdblGEOTLFcbeD/R3lP891TJTzj+10f
 wjg8VLjgXh6K258ZPcsHWTBUWaKnoOoEeWWRKEOaVBfbPoASd0CQ8jxzjKaNRYzcqqbd
 BYyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:to:cc:from:subject:autocrypt:message-id
 :date:user-agent:mime-version:content-language
 :content-transfer-encoding;
 bh=sckBll5EIRKG8pKqjRpKKS0dDw5aO9GxSUjaykXzPao=;
 b=TvP6jrLJEO0Ozx/1zYsJ0JyMjYVvJyCXVzqqg+svo2lyOi0v8m67CCZEcb/El/IkrL
 Z9+LmB0TARGQSYjPRWAldC2z7Gzw0ylZYBI1m8IIF1s9c7/442pCBITq+qcBBGu6c7uH
 zITGMk61wrq2LYecOcxfccwU5QSdNRZd19F2M8nU03BdsDhpaBXN/NhkdpHQRPX2W2fU
 CC9LGPe68qSOyHUcTFeXyc0NCj8fXjyCqzVSqkOZsmJ34lYfvVhQ1yOc8whXLF6r+f22
 j4hs9KKhBBkysnhlnz8P4YNGVRnPsS5geklYeews7JKajIDqfrioBQfjBHWNp2uPYcJy
 oGaA==
X-Gm-Message-State: AOAM5338rZWqWdfN0mZmP1cQFuOGK1JsREnUHV8FEmBrXgSsY4lQNVSO
 HGKaj0XGT7NaZZNEBlCHjTE=
X-Google-Smtp-Source: ABdhPJzW7oweQ88xm/wbnd0ZJS2R4ADl6PIDxaMYJyln43ML9+TfDibSRFjF+Lo0JfLkKTsxi/fitA==
X-Received: by 2002:aca:4e11:: with SMTP id c17mr9771863oib.14.1608527564474; 
 Sun, 20 Dec 2020 21:12:44 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 n93sm1164658ota.37.2020.12.20.21.12.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Dec 2020 21:12:43 -0800 (PST)
To: QEMU Developers <qemu-devel@nongnu.org>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Dropped/disabled NVME support in qemu
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <bcf1a98d-e86b-7b34-e384-b4b7e0e22747@roeck-us.net>
Date: Sun, 20 Dec 2020 21:12:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=groeck7@gmail.com; helo=mail-oi1-x230.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

since qemu v5.1, nvme support has been dropped from several architectures.
Well, it was not exactly dropped, but disabled.

On those architectures, trying to boot from an nvme drive now results
in the following or a similar error message.

qemu-system-alpha: -device nvme,serial=foo,drive=d0: MSI-X is not supported by interrupt controller

This is the result of the following two commits.

fbf2e5375e ("hw/block/nvme: Verify msix_vector_use() returned value")
1c0c2163aa ("hw/block/nvme: verify msix_init_exclusive_bar() return value")

Affected architectures are alpha, parisc, ppc, sh, and sparc, and every other
architecture/platform where the interrupt controller does not support MSI-X.
After reverting above patches, I can boot from nvme again.

This does not really matter for me - I run my own versions of qemu anyway,
and don't mind carrying reverts if I have to. However, for my education,
I would like to understand why nvme support was disabled, especially since
it seemed to work for me just fine for years. Can someone please explain ?

Thanks,
Guenter


