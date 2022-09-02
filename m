Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B05635AB699
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 18:32:35 +0200 (CEST)
Received: from localhost ([::1]:54332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU9as-000875-75
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 12:32:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oU9WY-0004YF-M6
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 12:28:07 -0400
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:45650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oU9WX-0002rq-3g
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 12:28:06 -0400
Received: by mail-qv1-xf29.google.com with SMTP id jy14so1775963qvb.12
 for <qemu-devel@nongnu.org>; Fri, 02 Sep 2022 09:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=R2aeYbqN+qMVfiWquN001oBLXHd8DgcrJc9QSH00/Cw=;
 b=GiwaQ+hgI5jddnDmfka6xVcpvIRGgGmDGelwRAxR6bN/vNo7A2Tzo0JCI7HHCmVB4Q
 Kp67N29kwxIwVMlaKOft/Dlzea0WxmCZcOossmI2IeNsgoOiMwzTuQBgjEYBad7Xcgvi
 wfU7H17YMzQTY27aX+0Oor5OHZZjSocAsUapnoF2Eajt369W6m//c8Mlpqkix1OgJJr2
 vUVK2bsLNg4noVWje+6Tg3mhslTzHwrYg8+4Xo+GUNp44rpXdKLpJpXnOFMBSEaZe2oC
 e3DimUfizUyXgNmrivRjRfDVisMqR+kb9HDhJKjDjMcey28xg+kY/wTlJ5RfqPJ5YP8p
 kBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=R2aeYbqN+qMVfiWquN001oBLXHd8DgcrJc9QSH00/Cw=;
 b=bXHAYTWXVQw0YI5Mgo5X+/BtwJEehkx2WnEkbSonDECAyG2DhPdkmH2ettJrOxmsCN
 7RLzH/zNT+Rty8AyLzkw6oz+DL2BAQxXDRh6hIJtTNiINw6HbXA0XObhqzoEC4mD85h3
 HArSXASBPyqbo/vxWXbPsBZ5nqnMbsKOCCag/qlXX+yVSSODWm0tlphP/5L3YDmLvMCZ
 Kh/1+qTb8wq0QVBPDiV38SiadEjyH+z6VYPGk1OqlMQubEjsK7cbTbV5Yjew7n8sYj81
 I5/0r/XaNTXtTuUPzBAJKEjv1qSFFD4DWgKqLOBbo0k8RFnfdDTjceZpOyE0reIzuKay
 pfGQ==
X-Gm-Message-State: ACgBeo3nUy6D0W5CIeTHN1TlGtGVv9b1iBeonLReJyskD/YmfYgW5y2Q
 giXgapFsQOhfYJQ4Chd1bPFayL+g19XAYrpo1d8=
X-Google-Smtp-Source: AA6agR5b+cLKpP4Y7k2mwzPEijxkjjdpNSLYGFDborYkEYUMFmFU9xYeyg5/GoZxkt+JbgrARgI3eKImJBaC0v2j42g=
X-Received: by 2002:ad4:5d68:0:b0:499:b01:1c75 with SMTP id
 fn8-20020ad45d68000000b004990b011c75mr19563782qvb.114.1662136084052; Fri, 02
 Sep 2022 09:28:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220902133853.834065-1-mcascell@redhat.com>
In-Reply-To: <20220902133853.834065-1-mcascell@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 3 Sep 2022 00:27:53 +0800
Message-ID: <CAEUhbmX+NdXRFCje9pDr9SXLHB5=822PFxB5qHpCmcXk9cES6w@mail.gmail.com>
Subject: Re: [PATCH] qtest/fuzz-lsi53c895a-test: set guest RAM to 2G
To: Mauro Matteo Cascella <mcascell@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Bulekov <alxndr@bu.edu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 2, 2022 at 9:39 PM Mauro Matteo Cascella
<mcascell@redhat.com> wrote:
>
> test_lsi_do_msgout_cancel_req does not run on machines with small size
> memory. Reduce guest memory from 4G to 2G to alleviate the problem.
>
> Reported-by: Bin Meng <bmeng.cn@gmail.com>
> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> ---
>  tests/qtest/fuzz-lsi53c895a-test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Tested-by: Bin Meng <bmeng.cn@gmail.com>

Thanks!

