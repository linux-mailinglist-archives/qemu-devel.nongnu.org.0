Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A40668F45
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 08:33:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGEYW-0002nV-H5; Fri, 13 Jan 2023 02:32:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGEXy-0002Rf-DN
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 02:32:18 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGEXw-00055S-8S
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 02:32:17 -0500
Received: by mail-wr1-x429.google.com with SMTP id co23so20226921wrb.4
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 23:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SuIubxJ3bnLD7poja9NWW7ikeHroQJvd/gaTH5+2XoU=;
 b=BgDRCNj0NsaPsl5fWKQV/7kpWjFL8B0w8S/u33SO6ffKb+0cMkR+2/UV4DWX83i3vo
 C/yUveAimBEbEjqcW3jZeVyVRZo2P6/O9Swscs1BuK6VonfBl3aJeDAc+tUfoUyIUHtt
 DhVDWsyGqJHkqM2Ud2VhydwfFTMFpmk2XEDQ8AKUQwTPI8tsbMtMkD+DwxV2K9524XvA
 umb+FqTEhzXJ1qLmlVToPVf/C5UdMfgb2mTe1E3vp9REs0F4U9HpIjJUSVLZc3ZrcirX
 S3ARm1c8gEx6W4xuE0DPKXp+IqE+fpLnk34zROImtEqxQOYDK/Mb4A4WvDqrSivBUV4E
 0leg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SuIubxJ3bnLD7poja9NWW7ikeHroQJvd/gaTH5+2XoU=;
 b=WBMiDllBKEPYQmWUMCbEp9bJjLvU/EZM5Pwnd5H+iQqBUUJQ3tzX7YMkZH4dBtBK8w
 3fR5aTcpqV01BnwQClcB3ZECR1w9UtJR6FAkS8gD9+hhrMq8gp7Uo+9yQut/LVHEEIVs
 RwEKMMe2TV/i+FCA0RQINxbpEHOafrlS3vmisL//MXsKCqOweuLIyasdQ43MvnCIyMOv
 +pN7r3tbdNOE+OIausQlXUlYxMQrDnQJe9Rsys+V2HOszMT5mSvRoiGllWOluJ9u22Y6
 L04bjyS+BoLeK1XD/JSBnhwQTeTDctoBPdXJgED9tWM+wsQqKBgc/Z/APlOiw/q12K98
 Q41w==
X-Gm-Message-State: AFqh2kq2bHVtsGEjf0BsZzCgiAYO54vnnbjlmUgTH1TSh/T8EEME1mC3
 X73qORTeCN/ILFSQPw5ibh2VyQ==
X-Google-Smtp-Source: AMrXdXtv/8LYwWAdyjjCYr913Nz+dGhUZr+8kd4N3I1P5+rgmNZeP48TcCdjJ+MeXZU+GWtOAhNdOA==
X-Received: by 2002:a5d:61cc:0:b0:2bd:be3b:49f4 with SMTP id
 q12-20020a5d61cc000000b002bdbe3b49f4mr7896237wrv.22.1673595134608; 
 Thu, 12 Jan 2023 23:32:14 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 f16-20020a5d50d0000000b002755e301eeasm464217wrt.100.2023.01.12.23.32.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 23:32:14 -0800 (PST)
Message-ID: <b35eaa23-2f58-a175-67a9-cf22fc6ef925@linaro.org>
Date: Fri, 13 Jan 2023 08:32:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 3/4] qemu-img bitmap: Report errors while closing the image
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: hreitz@redhat.com, aesteve@redhat.com, nsoffer@redhat.com,
 qemu-devel@nongnu.org
References: <20230112191454.169353-1-kwolf@redhat.com>
 <20230112191454.169353-4-kwolf@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230112191454.169353-4-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 12/1/23 20:14, Kevin Wolf wrote:
> blk_unref() can't report any errors that happen while closing the image.
> For example, if qcow2 hits an -ENOSPC error while writing out dirty
> bitmaps when it's closed, it prints error messages to stderr, but
> 'qemu-img bitmap' won't see any error return value and will therefore
> look successful with exit code 0.
> 
> In order to fix this, manually inactivate the image first before calling
> blk_unref(). This already performs the operations that would be most
> likely to fail while closing the image, but it can still return errors.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1330
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   qemu-img.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


