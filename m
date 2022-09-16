Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5D75BAF68
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 16:30:27 +0200 (CEST)
Received: from localhost ([::1]:39686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZCMM-00040A-80
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 10:30:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1oZCJG-0000Rs-RF
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 10:27:14 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:36371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1oZCJE-0007Bs-44
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 10:27:14 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 s14-20020a17090a6e4e00b0020057c70943so25864666pjm.1
 for <qemu-devel@nongnu.org>; Fri, 16 Sep 2022 07:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date;
 bh=SxK+8r6WWXjaYbHfUsvSJpeaDsBL9HQkoqXbEeIiSHs=;
 b=fswotqqvFYVw6hNmcEvM666ymxj0V8DrfIzONxpAG9Po7dizcLi3Gtmr4ZYUtuRPgW
 Rl/r46WMcS199TMFj59sSZs/SzZpALHXkwBdldUHkAyHXvss9zrurV0UabYLvoITp5vD
 qPa5ceDUwemHH7i85JJ+PzR3YBa6AUiAlU14ptASnZnBXQwblen0voDtt+yLb0t2As0i
 kXe6fysqy1xgir/hOdPfqjJS3c+VE7Ub82wEz72WwCJ2EBdRuu0Y3LPKxo70ycGEPPKo
 2e65gfmNo237+36HLpB1vB6a0ZyEJsFUkxN/2dg4/m/j6uqDAjyh46VTcSnwtZlfSevk
 iD6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=SxK+8r6WWXjaYbHfUsvSJpeaDsBL9HQkoqXbEeIiSHs=;
 b=QXDGGYvp1xCTrzncolYHDoPjteWRElKAYmrjpAxeF2m4ZhK+U90xfuthK+/QYhia0z
 JM0MxOwQb1aKfyZFUuBz9Ci7iuPi9iLb7S8HRmJC6ApvXAbYoBU2MXaoTrK2hWvZ1jJK
 gyZpLlMUe74FhCkAnaFoNwW37FKfXv3b71IFIXz1972DF+KMO1rZpM5bnMQbJ5Pa7OkY
 gxPf9ytuZNA74A/0q+S+HJMRyWGx4ztF3KwiwioDnQPZmG3yc+6OO1Dbrfwlm3zwASMq
 ScYdbKiK4YyuMPS+HNjkpFQ9aKGbpD9Rvm2euNaCxKfFhAjSuK0b+maplmvHwaRIP4yh
 /4qg==
X-Gm-Message-State: ACrzQf1Fe7ic7UngPkrTmMMyq1IYfXM6vgWdgfpnW0h8xYvSCziUOyR5
 t1zKKje8GD8NwcFZuNB+Pbs=
X-Google-Smtp-Source: AMsMyM6Bw0leUpkBF5PpoAEfrFywKU1AILoBcbk9yS14xVUriYHK73nLxSvENh7yDJhko9hlA9D7AQ==
X-Received: by 2002:a17:902:f0d4:b0:176:988a:77fd with SMTP id
 v20-20020a170902f0d400b00176988a77fdmr113301pla.25.1663338429904; 
 Fri, 16 Sep 2022 07:27:09 -0700 (PDT)
Received: from [172.19.1.55] (50-199-13-217-static.hfc.comcastbusiness.net.
 [50.199.13.217]) by smtp.gmail.com with ESMTPSA id
 f11-20020a170902ce8b00b0016dc78d0153sm14996189plg.296.2022.09.16.07.27.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Sep 2022 07:27:09 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <c46bf066-3702-d28e-dcb0-d7b4e3718aad@xen.org>
Date: Fri, 16 Sep 2022 07:27:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] hw/xen: set pci Atomic Ops requests for passthrough device
To: "Ji, Ruili" <Ruili.Ji@amd.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "Liu, Aaron" <Aaron.Liu@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 anthony.perard@citrix.com
References: <BL1PR12MB599341DC55BA53FE588DE14E9B7E9@BL1PR12MB5993.namprd12.prod.outlook.com>
 <BL1PR12MB5993C52DD9A881FACE6FA28D9B419@BL1PR12MB5993.namprd12.prod.outlook.com>
 <BL1PR12MB5993DC46EDF5D01ED20E2E179B479@BL1PR12MB5993.namprd12.prod.outlook.com>
 <8be84a25-c31d-fd88-f913-c03c15046a55@xen.org>
 <BL1PR12MB59937394D936EE7EDF5E3F809B469@BL1PR12MB5993.namprd12.prod.outlook.com>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <BL1PR12MB59937394D936EE7EDF5E3F809B469@BL1PR12MB5993.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=xadimgnik@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.816, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/09/2022 03:07, Ji, Ruili wrote:
> [AMD Official Use Only - General]
> 
> Hi Paul,
> 
> Thank you!
> But how could we merge this patch ?
> 

AFAIK Anthony (anthony.perard@citrix.com) still deals with this.

Cheers,

   Paul


