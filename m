Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA546E56CA
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 03:43:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poaLp-00011Q-JT; Mon, 17 Apr 2023 21:41:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1poaLo-00011I-0R
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 21:41:44 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1poaLb-0004Kd-9R
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 21:41:43 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-63b73203e0aso5159191b3a.1
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 18:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681782089; x=1684374089;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yRlhLSJFgwxXuWeNs5ZaojUDAXQrVYzHhrdAx4WpSk0=;
 b=p/nEDfT4Bagrtx2YRCXRcphvt30wGNuo4x4yHyy2HhH2Uc+yUGaGutNl+VeI5EP1QW
 hLY3d7lV/W7kVbD5GZ1JeNgYVHoDWdTZj620bHhnkjG7W6kluWhKes1fWMJfUQyTUiH/
 rAeGW/x6+q7Wmx7ZlDkX4s4UJfO0zDFw5mjM2OFiUQ4inAZyTH4gCSnzGJ4ZlMjnzhKM
 /D3U64X+BYGV+VyhErh+WWXioevtJrDI5RPIiLei3nXnhnLQZYKO9iCq2XixeBTYJxXf
 b8o+uHYO+bmURksC9LldO4kszNptsyTZemvyR8CJvMSy9pRTJBkU0gpcgRKKlHTp/aiy
 zyiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681782089; x=1684374089;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yRlhLSJFgwxXuWeNs5ZaojUDAXQrVYzHhrdAx4WpSk0=;
 b=Gb/764Ki7pzAWKtWUIvxaEE5PK7eSshLIvuYUhxd5et0s8XZvDH3uwEMUo4UB1+T0R
 pBNtFk+OBdrk6znW7vyS22HPZe/d/q41AbuFlfQYNlaPXu5YSLTsNv9nErRg2TE4oYQp
 LLooFmp4V+apgM1X5bqc4LJH0KZVDrV/UkHToPmvRDLdG/HfOFxu8rmhL/qsB9NdgZnX
 SaZFRY051KQA2RVwIZ+98QoSx95NsHiMU4WOba5Qxq59915cwC3GyJJ4uANAWS9laVyv
 MGDRWwcIrtmartCSF3JiVR1qKdR0ZJt+Rtvq3UH0YDEXuPAGJ6tjp9MKl4I1dIbelH7a
 aUNg==
X-Gm-Message-State: AAQBX9f8rutL5wdmLkTXL7yUqJdyD5V+egQn/xRsDaICMc/llIGHAixq
 ExkJoJQDFD6BqXjlZswwoi0=
X-Google-Smtp-Source: AKy350aVPhUogb4/1Yl25pFGuI0Tbc5lJBmOLn8AWvNTmDYPMFF0IJSy8DuQQQFlaeRKazIl3yQaqQ==
X-Received: by 2002:a17:902:ea03:b0:1a6:6edc:c884 with SMTP id
 s3-20020a170902ea0300b001a66edcc884mr585802plg.16.1681782089428; 
 Mon, 17 Apr 2023 18:41:29 -0700 (PDT)
Received: from minwoo-desktop ([1.230.133.98])
 by smtp.gmail.com with ESMTPSA id
 jm10-20020a17090304ca00b001a526805b86sm8269629plb.191.2023.04.17.18.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 18:41:29 -0700 (PDT)
Date: Tue, 18 Apr 2023 10:41:23 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] nvme: remove constant argument to tracepoint
Message-ID: <ZD31Q8+iJyeeR7OX@minwoo-desktop>
References: <20230330124427.40631-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230330124427.40631-1-pbonzini@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 23-03-30 14:44:27, Paolo Bonzini wrote:
> The last argument to -pci_nvme_err_startfail_virt_state is always "OFFLINE"
> due to the enclosing "if" condition requiring !sctrl->scs.  Reported by
> Coverity.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Minwoo Im <minwoo.im@samsung.com>

