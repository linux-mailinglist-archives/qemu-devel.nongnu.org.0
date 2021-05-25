Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 074BC38FC04
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 09:54:14 +0200 (CEST)
Received: from localhost ([::1]:59410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llRtF-0005HM-3T
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 03:54:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llRrR-0003KK-8q; Tue, 25 May 2021 03:52:21 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:45723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llRrP-0002bv-Lv; Tue, 25 May 2021 03:52:20 -0400
Received: by mail-wr1-x42f.google.com with SMTP id x7so11473564wrt.12;
 Tue, 25 May 2021 00:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vA2S/PNwp3mUsmLdoqKmOPp1Am9HqR9qjqotzjkt+SI=;
 b=mBHQJ3HrOISsuxnXOpdfQhrgLDHLsIpTW0TiMlpn7h/MyNSNFPja04Z9CCnRUL8bVM
 e8pGoefNExrqqVLGzYJ+sM79S7FtAhi2EzM/lfA8vV4/kM1E+13CGVieBXb9e1biLQ3X
 3aJKVvDFNcg0jZxnn4L/pn3smwLtE2nk3IiRIUXPUGXgUcG6yuuy9H7YWSDRiI2eKF8b
 CKRouCpkQUKDHBoMB+2VPQsTiguuga91Fh77mvHZU637B1Y6fIvN1+mu/tOX51uFHjvW
 Mwvc4tILL+qAtlnz1KWih1saqJWYATZnlhAcEHh3hZWTHLSC7uF0gaNUbrKk3G0QKEja
 TrDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vA2S/PNwp3mUsmLdoqKmOPp1Am9HqR9qjqotzjkt+SI=;
 b=AY2+1qiMrwgADkkmMOqP+W6WIL51f4w/OvgQ3Ncr4RPunCSr+0FTy0ZdfR+v+l+eeR
 4UFB5f6xKbgNuTpOpHRVpOJKi5VxDmOqS1/EFGt/EvG8gLNfVe0abmdyg41U/8V72t/Q
 UeDRV2G9mZ483ARjcPDQpnQC93GcCMTLG71sU1tT+KVHQRTUSpqqolglUgnpCK5WODGJ
 k3pgopotvVpIlkE5FODTD+0cI5kTsL7jYHQgKAcP+b4pRRYxk92d6b7mXiDslyYer2HG
 ewE6jUXQLL8WDYvoSjy+Q0u3II2dV6VfwMHuQ3iElB4nPVgZEVAvA1cwRV1MBhLDd+d0
 4aeA==
X-Gm-Message-State: AOAM532YsEnE52/tlUXgt8hnAIq67C5KjJEeJGgxxqfkYyTEdvS+T4X+
 kNH5ANBuZVI6ozaOiBOMOwg=
X-Google-Smtp-Source: ABdhPJyRlQFFAnXk1vDhiFE+VQpJIwFy0RVfr0J2Oqm56jrwVmS8eyDW6h0e1nMweyic/3twTtw6DA==
X-Received: by 2002:adf:ed52:: with SMTP id u18mr25109868wro.379.1621929137959; 
 Tue, 25 May 2021 00:52:17 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id p10sm14125375wrr.58.2021.05.25.00.52.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 00:52:17 -0700 (PDT)
Subject: Re: [PATCH 0/2] tests/acceptance: Add tests for the Pegasos2 machine
To: qemu-devel@nongnu.org
References: <20210515134555.307404-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <df79dc22-85fe-a5fb-a3c9-00e48c58194f@amsat.org>
Date: Tue, 25 May 2021 09:52:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210515134555.307404-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <huth@tuxfamily.org>, qemu-ppc@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

On 5/15/21 3:45 PM, Philippe Mathieu-Daudé wrote:
> Philippe Mathieu-Daudé (2):
>   tests/acceptance: Ignore binary data sent on serial console
>   tests/acceptance: Add tests for the Pegasos2 machine
> 
>  tests/acceptance/avocado_qemu/__init__.py |  7 +-
>  tests/acceptance/machine_ppc_pegasos.py   | 98 +++++++++++++++++++++++
>  2 files changed, 103 insertions(+), 2 deletions(-)
>  create mode 100644 tests/acceptance/machine_ppc_pegasos.py

