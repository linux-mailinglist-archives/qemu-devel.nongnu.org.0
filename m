Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BD46FD2E1
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 00:58:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwWG7-00082n-Vw; Tue, 09 May 2023 18:56:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin@koconnor.net>)
 id 1pwWG5-00082c-5l
 for qemu-devel@nongnu.org; Tue, 09 May 2023 18:56:37 -0400
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kevin@koconnor.net>)
 id 1pwWG3-00050u-O8
 for qemu-devel@nongnu.org; Tue, 09 May 2023 18:56:36 -0400
Received: by mail-qv1-xf31.google.com with SMTP id
 6a1803df08f44-61a9bb1b3a0so32104036d6.1
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 15:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=koconnor.net; s=google; t=1683672994; x=1686264994;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VoP8C+VuDjld3b5fWFHYoTtve0BkMZerzgYQsT01O+M=;
 b=edRPdypbftrD73UAR8flFr2nM1WkAqCuuxiGSz6qtiH0f9vHB26G1NeoGROe4cBd/G
 fSSSZhIaA2sMQPGxNMAAXCEnmiK1iJYStflSHmlEFAL7r8hQTg9jJ4argsp3hHAnQe6X
 FrugJdCqC0qc79bQzGcp6f1T0FqfKfEDcmOS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683672994; x=1686264994;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VoP8C+VuDjld3b5fWFHYoTtve0BkMZerzgYQsT01O+M=;
 b=MjpOLUi3UXcvjzOoeK2ElqkFgRr2wl+WhxjPxKxHBrHDbHdXSUk3dxmIbojrWciumM
 NfPm150L+RoPVT2tA5+J+nd94tZHp/sP9KdsGCXN50V1wvpFxk2NWec9xU7WzjW0Jq3X
 NudzIRj45mm23gxOGna5rkLBdN/sK/ZMOe4o9dUSyicSuUy0EOWAbkTdqZpJ2OK1oKbs
 dOwEAiDctpp7R5v5DUmEKG7DluKdgR3wmDet2olPyat9sQzNGLu8ROIyXk2N/VQMqI3F
 /1jE0xIrsZ+h0AxvuvfilN72Rm86WP+BDlop74RCof0+6Acw7TsOytjchHKrix1FB6Xy
 XmYQ==
X-Gm-Message-State: AC+VfDzEDJ4tRMUNMwae78MkYaINKdbY2f6sQdiJvRUw4ItJZHCnM8I8
 J+58QVvGyegg/47JgCOh3nVdeQ==
X-Google-Smtp-Source: ACHHUZ48akWe8T5ggua4b2dsUlcoghBPeJNdI4ILjSupJwZ5HQRoq6O9FM1HrWEg/NRv+OoYrJyiWg==
X-Received: by 2002:a05:6214:258f:b0:5f1:6bee:f58f with SMTP id
 fq15-20020a056214258f00b005f16beef58fmr23975724qvb.26.1683672994126; 
 Tue, 09 May 2023 15:56:34 -0700 (PDT)
Received: from localhost ([64.18.11.69]) by smtp.gmail.com with ESMTPSA id
 f3-20020a0cf3c3000000b0062075f40f61sm1098655qvm.73.2023.05.09.15.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 15:56:33 -0700 (PDT)
Date: Tue, 9 May 2023 18:56:33 -0400
From: Kevin O'Connor <kevin@koconnor.net>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: seabios@seabios.org, qemu-devel@nongnu.org
Subject: Re: [SeaBIOS] [PATCH v3 0/6] misc tweaks for kvm and the 64bit pci
 window
Message-ID: <ZFrPoQR05scfUWrd@morn>
References: <20230505071117.369471-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230505071117.369471-1-kraxel@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=kevin@koconnor.net; helo=mail-qv1-xf31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, May 05, 2023 at 09:11:11AM +0200, Gerd Hoffmann wrote:
> v3 changes:
>  - rename variables, use u8 for CPULongMode.
> v2 changes:
>  - e820 conflict fix

Thanks.  Looks fine to me.

-Kevin


> 
> Gerd Hoffmann (6):
>   better kvm detection
>   detect physical address space size
>   move 64bit pci window to end of address space
>   be less conservative with the 64bit pci io window
>   qemu: log reservations in fw_cfg e820 table
>   check for e820 conflict
> 
>  src/e820map.h     |  1 +
>  src/fw/paravirt.h |  2 ++
>  src/e820map.c     | 15 +++++++++
>  src/fw/paravirt.c | 86 ++++++++++++++++++++++++++++++++++++++++++-----
>  src/fw/pciinit.c  | 20 ++++++++++-
>  5 files changed, 114 insertions(+), 10 deletions(-)
> 
> -- 
> 2.40.1
> 
> _______________________________________________
> SeaBIOS mailing list -- seabios@seabios.org
> To unsubscribe send an email to seabios-leave@seabios.org

