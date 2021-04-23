Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 515F33697F3
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 19:06:11 +0200 (CEST)
Received: from localhost ([::1]:60532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZzFq-00011K-Cb
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 13:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lZz7P-0002cW-Rd
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 12:57:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lZz7O-0000LP-DA
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 12:57:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619197045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qdG8eahThLJmLD6eUB1M00/iwTUItduaUQlMMC8SbyM=;
 b=ge/FlNhjQKTMyWGnJCPS1+m4K3lBR+GgjxpCv+yQoCOAs6Wmm1oe6v9oX4xL42QktvVriv
 /Nt5cyBOXlVAcWr5oGLBtcGPzAP0rffYd6UWyoRASE6AB7W+bmUd6FisE7YFEKdjvib863
 FnszKbf3F2zt6oeRm9OzbLwOCekAWc4=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-_ZVqtjRENNOx2Bq-LMYLcQ-1; Fri, 23 Apr 2021 12:57:24 -0400
X-MC-Unique: _ZVqtjRENNOx2Bq-LMYLcQ-1
Received: by mail-vs1-f70.google.com with SMTP id
 o17-20020a67eed10000b02901b5b718cf27so8412227vsp.4
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 09:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qdG8eahThLJmLD6eUB1M00/iwTUItduaUQlMMC8SbyM=;
 b=lbr/GpjQU1HKn7xPMcv/q5b+smwQXwTJHpNHFKiZY1uJn4oDwxLOhpIZ8NH6LZVdtL
 8ULWZsJA/22b7eOACjT1NggOffSDD/AOjWpmbswCjPN1WWIRFK9pSx8UTyINuiWxiX5q
 sJ4IbN0WXMxtCx9Q0jSddOh/fWfRLXi62kg1vRQ9LOESM/TZa4lXSunxoHnxM8LuQWhR
 qgM1AMo6cgVD2bb4kC1aetfTe47r+7gjut0HuuKyrn+x5D+2pcqbil/fwByn/nqGd6pN
 RdcYiJCQefzbyXlHK1vKYmNCKsuzrfTFxkfFbqvEyKvreK7IAtF7FPG0wYcDBiD6xcXm
 48Hw==
X-Gm-Message-State: AOAM530RthSR15184ZDi1T5wXPnCnPkm1WZx485Sr+b2MjTxMJNpW3/p
 LjtbaqUYykX2QcIgE2wPHHBF7noN0zTvgXpY6lLmb9PWY6ysyBoCd7egfvK87GwWoAQU27OZA6u
 xrAWExrVqtI209AWWNw/+rSF7stb3b6I=
X-Received: by 2002:ab0:1648:: with SMTP id l8mr4292149uae.124.1619197043655; 
 Fri, 23 Apr 2021 09:57:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/K5ma/jnqhkHzhp7JIRdIU4Km8fjWZCFHnQ9nZ/10u6OeHxCE8VTtbrjjLHoZ7RAbyOpusDT0F8ROqrbzO5w=
X-Received: by 2002:ab0:1648:: with SMTP id l8mr4292139uae.124.1619197043474; 
 Fri, 23 Apr 2021 09:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210408195237.3489296-1-wainersm@redhat.com>
 <20210408195237.3489296-3-wainersm@redhat.com>
In-Reply-To: <20210408195237.3489296-3-wainersm@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 23 Apr 2021 13:56:57 -0300
Message-ID: <CAKJDGDYtM43cysCmxSkzQtH24agyuHiKhtZBWecgDO8G7wzh8w@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] tests/acceptance: Fix mismatch on cpu tagged tests
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Philippe Mathieu Daude <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Cleber Rosa Junior <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 8, 2021 at 5:00 PM Wainer dos Santos Moschetta
<wainersm@redhat.com> wrote:
>
> There are test cases on machine_mips_malta.py and tcg_plugins.py files
> where the cpu tag does not correspond to the value actually given to the QEMU
> binary. This fixed those tests tags.
>
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>  tests/acceptance/machine_mips_malta.py | 6 +++---
>  tests/acceptance/tcg_plugins.py        | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


