Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC19A30A35F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 09:35:24 +0100 (CET)
Received: from localhost ([::1]:49630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Ug7-00032X-UW
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 03:35:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6Uf1-0002cB-Qu
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 03:34:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6Uf0-00050C-DO
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 03:34:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612168453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KX+uRxPv+Xdg64HCiwhE4qlAszYPwYMLQ0mJfbozZVA=;
 b=XLQPE6IG+DpqU51wuK6OB9uWiwlHj7UwkK8tvGBzA1z6XkiMC2D3WqfmkbauwdkTEEIaXE
 VcPGIz9jup0cfZIQwv/hsRreC0N/CTL2GGRoV6dqpDnHc30HrCAA+c4dLJi+66Sc98nw4D
 sOLD/K4bn0Auc312xHdBLQZGxIjiG7M=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-hWeGbsxuP-WlhVqW3QrM5g-1; Mon, 01 Feb 2021 03:34:11 -0500
X-MC-Unique: hWeGbsxuP-WlhVqW3QrM5g-1
Received: by mail-wr1-f72.google.com with SMTP id s15so10008460wrt.14
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 00:34:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KX+uRxPv+Xdg64HCiwhE4qlAszYPwYMLQ0mJfbozZVA=;
 b=QJ57KDrXBrhP6YAHP6uBpcEvy8UsuU0S4scNLjs6OoWXyrHY6+eVx5xBpaK7s7f4R4
 ufXW/5KZmzLkjr1C5KyGicR/LNVbwdiE5SwZ5PGP3PsPrKfvQJ8zbAo/PFGfPdpiZnVM
 kP07rJ6tilNKe0tLdCvOf/FLGopcbqvr7es86Ywk5rWQ1itQcoL2Ktf5ARWWvka9eUdg
 DwVYJ+7GSv3M2Bxhz1h2BagKH/c0HXKb7IQPiJ87aZUT7uYFluqggoMSssBojZo8nexG
 LdSM2VoI1qhxI1h9aDqRnjUvBi7xFuNTdEcDWJ/KSLubHYDTy8rAEaHKal9DG9QB/XQO
 Uk6A==
X-Gm-Message-State: AOAM531y1imA7vsTUkF5f0FB0wR/QgfuYN22yRhm7LjNjmk0/bJbllRo
 K3Z9aHbwAfp8KpEMX4Dx9EaEd8u+Dqxs+/NZY5v/yPFaVtQ1w/QnDYKCCP/HW3kfKOqQWIibnSA
 YJjAKcBIYCD6t3PA=
X-Received: by 2002:adf:f1cd:: with SMTP id z13mr16658353wro.126.1612168450091; 
 Mon, 01 Feb 2021 00:34:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxlbZidlgqYxXTPVcE2WxH9hlqEMibINz4X4Xli4/wU54kBlVuD5r9CjusoNxQYB2dQGEyntw==
X-Received: by 2002:adf:f1cd:: with SMTP id z13mr16658328wro.126.1612168449883; 
 Mon, 01 Feb 2021 00:34:09 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id n193sm20578950wmb.0.2021.02.01.00.34.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 00:34:09 -0800 (PST)
Subject: Re: [PATCH v2 1/2] pci: reject too large ROMs
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210129192838.582771-1-pbonzini@redhat.com>
 <20210129192838.582771-2-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ec623a81-9ebb-b170-9574-194206964070@redhat.com>
Date: Mon, 1 Feb 2021 09:34:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210129192838.582771-2-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.079, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: lersek@redhat.com, dgilbert@redhat.com, peterx@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/29/21 8:28 PM, Paolo Bonzini wrote:
> get_image_size() returns an int64_t, which pci_add_option_rom() assigns
> to an "int" without any range checking.  A 32-bit BAR could be up to
> 2 GiB in size, so reject anything above it.  In order to accomodate
> a rounded-up size of 2 GiB, change pci_patch_ids's size argument
> to unsigned.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/pci/pci.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


