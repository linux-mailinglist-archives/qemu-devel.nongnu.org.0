Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F6C3AF68C
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 22:01:33 +0200 (CEST)
Received: from localhost ([::1]:54070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvQ6u-00074u-FS
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 16:01:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lvQ5b-00065t-99; Mon, 21 Jun 2021 16:00:11 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:33581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lvQ5Z-00051n-Cy; Mon, 21 Jun 2021 16:00:11 -0400
Received: by mail-lf1-x12e.google.com with SMTP id t17so11965880lfq.0;
 Mon, 21 Jun 2021 13:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=/xsQ7RCoZ6S/LFZDo6TPvN3p5NYDXQ1OP/BT24zoCIQ=;
 b=WINReIdoAQmDXlbhipMEL+DMmJVmoai4vK5AZEQoNzrOFoE54rAwI3cO83jXjGR1WD
 l66kEbbanTSqdvqE0xYyt5UF/Ujm81jrw0paSSrlFGFOt8MB2koKZq14aJtX1yGCIFjg
 QG2EJUxU35d3M9ii1dVgrjEhBu/7638ClrXTEnUtFmuGP5QHPDYin5iNfeOPLA2qqHYd
 4SpAuk2lhK5J0h1ygbYE2gZ2DRYprtbPTSeCOjqrgHThrR9arckJbCXVvf4Xigjz9kC7
 xKVagoyIapv6+V5q9u9Ckd6iG50kjzrTmyYAImKWxMxTdjHrAe6+9Bsxwo+0BGOKZIvY
 Mo2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/xsQ7RCoZ6S/LFZDo6TPvN3p5NYDXQ1OP/BT24zoCIQ=;
 b=H+lM0UZ7PfZC1HpxUsEzungIuoZYzTKOZlMJPBBQzeNQLjeW2vrPT57JOQN9CftC+D
 aJReFIeSGYawraE7S7Y69qGx5HSJOUirtOJFRAnwwTcfl6CG71bg5kzNGx8IRdm+Y/jP
 7C97hnW/pfbLWqQqXQiAea6iwrnGCWP3vACaWZe+bCRMrljoYkt5PAfBDq/oGhAk15g9
 9xukPh62rw2qsnbsSPJbQpd0YUoIWC1prO1Af0fYnmLZ8AD6IwfnaXW+kFlD2PBJ1ArI
 zZMDTmI5XnP1ygFpYlzEjsPdWJ89lsQSQY/t7jIzU/ETjVc8n9BKzL3+mED2U4b4Xlav
 E87Q==
X-Gm-Message-State: AOAM530h6lrHfe9LwHUhHmuvg4qTh85aiHJmhLcTu4IJpMepbrsHyYOc
 Z/A7bl/GtkFnGL0wf0cN2HI=
X-Google-Smtp-Source: ABdhPJye7R1lu28nzjkyBDraJs7zu6LTIxNpgPI0ycANGc9k6kZXInt78S8VCgdRYmxSGQSrwA9cPQ==
X-Received: by 2002:a05:6512:261d:: with SMTP id
 bt29mr15101576lfb.231.1624305606822; 
 Mon, 21 Jun 2021 13:00:06 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id h22sm2472178ljl.126.2021.06.21.13.00.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 13:00:06 -0700 (PDT)
Date: Mon, 21 Jun 2021 22:00:05 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v1 2/5] hw/arm: add dependency on OR_IRQ for XLNX_VERSAL
Message-ID: <20210621200005.GA3586016@toto>
References: <20210621152120.4465-1-alex.bennee@linaro.org>
 <20210621152120.4465-3-alex.bennee@linaro.org>
 <d6012d09-a9c9-d7f2-9640-80f368a48ec0@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d6012d09-a9c9-d7f2-9640-80f368a48ec0@amsat.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, thuth@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, pbonzini@redhat.com,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 21, 2021 at 09:00:22PM +0200, Philippe Mathieu-Daudé wrote:
> On 6/21/21 5:21 PM, Alex Bennée wrote:
> > We need this functionality due to:
> > 
> >     /* XRAM IRQs get ORed into a single line.  */
> >     object_initialize_child(OBJECT(s), "xram-irq-orgate",
> >                             &s->lpd.xram.irq_orgate, TYPE_OR_IRQ);
> > 
> 
> Fixes: a55b441b2ca ("hw/arm: versal: Add support for the XRAMs")
> 
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


