Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4763634F703
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 04:55:51 +0200 (CEST)
Received: from localhost ([::1]:55840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRR1K-0005qk-B8
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 22:55:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lRQyl-0004nM-1Q
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 22:53:11 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:34511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lRQyi-00052M-AF
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 22:53:10 -0400
Received: by mail-pl1-x644.google.com with SMTP id o2so7165423plg.1
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 19:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=m0D8o4/eoqmPIG6H62pfGd9ibUnlCF0udQm7X/N1QmE=;
 b=kkKp+EvfoXJvAqlwuur/ecVOTDePyb0amrCjK4BH9JC443ytmL73gJDHJOZdSbWMOH
 reNHnEm7gIVssW5OLowkqeW88dwXG8sgYHVX7R9a3jWFkdbjD/uBVKwtdr6Adg/lfUn+
 TY33X1orWlq7mkP+gWPA1Ot5wJLutQYCidLF2SnaybrPrdHddnBTO9zHpgIX6fCO++bx
 SgWhQ4uFplCi4toY/Me060ojYSk6lFn1m0cKcVoJVyMOK5TdAMTzczuTcp/rIXiFTsHO
 WHkeODqBqtARrs7iYdBKKX3Egfl01AibIQWJg+dPyfpmQWNMPVhUaDFJcWMGXuC9TD0c
 TJJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=m0D8o4/eoqmPIG6H62pfGd9ibUnlCF0udQm7X/N1QmE=;
 b=JbMw7fi/+6cjs6EjroOAFGXz/V49n3j3UuMOkrpFmgVVmQ00IRIEQyaoGuKSNBHUga
 Bdbw+6bcSV1MxdreOooBpUg38W//MMfsVKXUapN2fHELxltdsYtGjc9wIEsVBbQpIowX
 e0llNy2jx52uar7CPek+LeWL9LDaDRfyo4BPW5Z4MLz0ITM+CT3NM91s/PquoueBwY+o
 E/E92vZe3YGRqX7JTNvYkMwnBU5sEv3Fau4I1Qyg3q9+zecE8nLhiH53g3WIah+Us8W4
 uAthMIeYkwIENy3xArAh+Te4JsgSKHGlxS9uS8CzRYpjvI11tlDr/xNXqemDK1V3yRfh
 2Jcw==
X-Gm-Message-State: AOAM530BlZrSXp1enek3m45bjlkI/BYhv7+G0KQy/2WJlzLynmQ7O0mk
 2kLkkfi5jBZPLHpAMkGZEKr5MA==
X-Google-Smtp-Source: ABdhPJx4ujaSZdA/pwjheNOQHlPt7BJ/cWcgOCUmzWCpVSIOnaSYoLtAxdGUnCoNNc/XGRGERIdmAw==
X-Received: by 2002:a17:90a:a103:: with SMTP id
 s3mr1329052pjp.158.1617159186038; 
 Tue, 30 Mar 2021 19:53:06 -0700 (PDT)
Received: from [10.0.10.142] (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id k64sm537280pgk.23.2021.03.30.19.53.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 19:53:05 -0700 (PDT)
To: QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
From: Rebecca Cran <rebecca@nuviainc.com>
Subject: Planning wiki page is outdated (says 5.0 is currently in development)
Message-ID: <c6a2d07b-4406-9a52-92f9-286911c79dd3@nuviainc.com>
Date: Tue, 30 Mar 2021 20:53:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=rebecca@nuviainc.com; helo=mail-pl1-x644.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I noticed https://wiki.qemu.org/Planning is outdated: 6.0 is listed 
under Planning Pages, but at the top it says 5.0 is the release that's 
currently in development.

-- 
Rebecca Cran

