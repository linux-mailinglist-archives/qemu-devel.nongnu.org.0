Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A1948BABE
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 23:26:22 +0100 (CET)
Received: from localhost ([::1]:52432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Pav-0001LM-Pb
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 17:26:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7PYj-0007h6-E0
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 17:24:05 -0500
Received: from [2607:f8b0:4864:20::102a] (port=51031
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7PYh-0004di-Tx
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 17:24:05 -0500
Received: by mail-pj1-x102a.google.com with SMTP id pf13so1523138pjb.0
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 14:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BSZNFeFj4Md/VJI4A0vvEXr+PrLm2CmiYYT3eAqlSNc=;
 b=phmo6sRpnr6n8hFu8EyNQA9vZEqJ+jpusLZRrf3/WVGdwjqqvB0R6JSXwlwsd2pria
 osPAyqeN+LGo20VI+sDKZgJVIdGr7J5aWPtzF4ad/avjc0OBeDTBxN35b5Zf46iMbDwA
 GIypXoFN5bAcUwlr9mwKW+/VM9ZEGbvuxZYmn0u9TkAdcO6G6R4sQwAqCp8YEOTYqSyF
 nxQVsAdBGMgbXULQVk55BE/+dROsreOWr+VC+dwVC+RHZ+VUU/1QWDyXk3nT8CU+G8sU
 wInY2XRkpHY+oi713s10/rGV2n3El1f7o5wxVUcpFMz2vej6EbRCa2Fh/PqbK2P7VLi1
 2UnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BSZNFeFj4Md/VJI4A0vvEXr+PrLm2CmiYYT3eAqlSNc=;
 b=ZvRBjckYI+vwhkEx6fkb0HYWDhExk/GG9PnSA5bnFV44qMVlFoytwSuRpByEVKiRSY
 6Gewz581aV38ej46BrznLREQkVX+uUHIod4z1dVQq+CJTO1qFp70mdhcmWDlaLk7ku+A
 5Z8643tii2nactizPMAlQiIm9VE4iiLrwLWJjOQJ/P5szZTZQKPufWKDA+C3XnYT2ToZ
 LWt9KaSmRrXZo8sLxHAPXnmNdKb9VeKBOz3quTmmjQt8XbGG9qPYmey7nE2CXIS4ijQM
 W8np6Pj8R3msc7K3rtHxPPn3OGUH7gANok8ES9sTmPPzRgphqIjnow/JKOSLzhBtytZe
 uZPQ==
X-Gm-Message-State: AOAM531RrMAEEKtF/ioMMcZXEMWfRcxOdaY3grUZkswOLztrp9ks8F9D
 HuBSlQDMMpi8Fzs8T15m6fg=
X-Google-Smtp-Source: ABdhPJwTCKiNloeFcyvSc2VAwpsV58/MttuXZR2Q2zXdVWk2VN4y+10uDXyi8KbQL8WBL9s/+2nUtg==
X-Received: by 2002:a17:903:22c2:b0:148:fcc0:aae8 with SMTP id
 y2-20020a17090322c200b00148fcc0aae8mr6458332plg.148.1641939835442; 
 Tue, 11 Jan 2022 14:23:55 -0800 (PST)
Received: from [192.168.1.33] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id o1sm766837pfp.197.2022.01.11.14.23.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jan 2022 14:23:55 -0800 (PST)
Message-ID: <b78fe11f-4a08-9c82-fa81-c7120b4447c8@amsat.org>
Date: Tue, 11 Jan 2022 23:23:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH 0/4] tests/qtest: Check for devices and machines before
 adding tests
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>
References: <20211220081054.151515-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211220081054.151515-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/12/21 09:10, Thomas Huth wrote:
> Devices might not always be compiled into the QEMU target binaries.
> We already have the libqos framework that is good for handling such
> situations, but some of the qtests are not a real good fit for the
> libqos framework. This patch series adds a new function to check
> whether a device is available in the target binary or not, so that
> tests can be run or skipped accordingly (also adding some additional
> checks for the availability of machines in the target binaries).

What happens if a device or machine is inadvertently removed from the
build? We won't notice it directly anymore, right?

