Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C657366E081
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 15:25:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHmtj-0007Mc-LY; Tue, 17 Jan 2023 09:25:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHmtg-0007MQ-IT
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 09:25:09 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHmte-0002Yy-Dy
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 09:25:07 -0500
Received: by mail-wr1-x42b.google.com with SMTP id r30so6332125wrr.10
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 06:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nKli5J1N4NYe9MapbSa+7OJBLD2slYX9dKu6X8nzO38=;
 b=QAbXuDVaTSnSXmaBhuAJEciTwhrbxlGUC7YYon2jMOldFCrKh0EJg0TRElvQgnGihi
 sPEjH3dEZFEamToTUMPnbaL9NskqcyHsOu17bTppK24iI1tgr7J0FRAlPXNdr9RN37GW
 tr8pfMIUdhvbuppHMRB08oZdDK/zgmesgWT6WElKpJUDGoXMTLNMHrVTeqkq3iL6dTOK
 qBMD+q5PlIRh2Hviwb9wsvnhWbO7KMyHMVBekKCDeH6RbOfTOuLnHO/XYY8/7Z2chgSZ
 kAGTCV9XGr3EXZMW68C177Q7g8bNhE6SRNMQlhBjzBFYnkU/1tbPLv2N93pcFkjQpbJa
 ZjcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nKli5J1N4NYe9MapbSa+7OJBLD2slYX9dKu6X8nzO38=;
 b=GYLgn39sgsS20IOolJQR00JyzNe9UjasWqnauQ//WI1nu3tN0/bBthqhbMGgXBxvYo
 BPMqQx59uDUYz9Mx+CJGqgXncvwZQso9e0sCaxcpX9KCuXCHblSAQ8hauUcJ048jZWUF
 Zq0YFZJxxHPkRBQHZKh3WBY8EfnlIf50jdC1xLG6ZewTDeX6nBXJ3OaVG46DmJ2EZ5+l
 rG4mttWoX+iYzfJp3LYmLnbOaIfwBTcEj/S5HStS92/Wlc1ZAZQuKkvg8U9IQsLlRE6W
 kDd6cLnmdVa2HONvLfTMVtJsxmtqnLwcOyMjA604dgQttTTEvlVjZ+PtwRRTZWpPlr6r
 kgHQ==
X-Gm-Message-State: AFqh2kpVwDuMcGQgqFuUeXI/pi3tnyGtqj4oBOU8CBfi3Gr/xqBURYhT
 ygf6s9fur7xj8ORj2mtS+IVFG2JAgZ1wFmpN
X-Google-Smtp-Source: AMrXdXvW5zd6gUozSSRsg7IGAkpen14hhSa0ovImr0+NCi1GK6ROmpRb/bHLsUNsnqN7eRhouQdFsQ==
X-Received: by 2002:a5d:5050:0:b0:2ba:bce9:8aec with SMTP id
 h16-20020a5d5050000000b002babce98aecmr3096883wrt.24.1673965504086; 
 Tue, 17 Jan 2023 06:25:04 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 i6-20020adfe486000000b002423dc3b1a9sm28450926wrm.52.2023.01.17.06.25.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 06:25:03 -0800 (PST)
Message-ID: <aad40d69-c570-de15-8258-cde109842af9@linaro.org>
Date: Tue, 17 Jan 2023 15:25:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: mips, nvme/pci boot regression (commit 145e2198d749)
Content-Language: en-US
To: Klaus Jensen <its@irrelevant.dk>
Cc: qemu-devel@nongnu.org
References: <Y8aU0fQRDm2hm+c9@cormorant.local>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y8aU0fQRDm2hm+c9@cormorant.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Klaus,

On 17/1/23 13:30, Klaus Jensen wrote:
> Hi Philippe,
> 
> Commit 145e2198d749 ("hw/mips/gt64xxx_pci: Endian-swap using
> PCI_HOST_BRIDGE MemoryRegionOps") broke my mips64 nvme boot test
> (little-endian host, mips64 and nvme boot device).
> 
> The pci device doesn't show up and the kernel panics.
> 
>    qemu-system-mips64 \
>      -nodefaults -nographic -snapshot -no-reboot \
>      -M "malta" -cpu "I6400" -m 512M \
>      -nic user,model=pcnet \
>      -drive file=images/rootfs.ext2,format=raw,if=none,id=d0 \
>      -device nvme,serial=default,drive=d0 \
>      -kernel images/vmlinux \
>      -append "root=/dev/nvme0n1 console=ttyS0,115200" \
>      -serial stdio

How do I get this images/ folder, or how do you generate
the kernel / rootfs images?

