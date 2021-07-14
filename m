Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B26C03C936F
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 23:55:58 +0200 (CEST)
Received: from localhost ([::1]:53956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3mrF-0000Kr-Oz
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 17:55:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m3mpM-0007RI-8L
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 17:54:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m3mpK-0003dm-Lv
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 17:53:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626299637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2lFajJeamlR5QQ3qRZjfAfMZMSCCMl1uHbPwU/5XZKc=;
 b=JiteGb8I6COI6gN8c67IPsXHUuxSW9ygVf6cB+1JkSlhx1O+5i2sKhjUOJfquX/E/OB3De
 6ekjyMGyCxPltQxz4ArFMoaA7KBRP+ZbkojNJ6OCA0KWreQINwpr1FCuDLUvFaBlOTc1HJ
 zQLNAjoZ0lIWGAI6ifjKWrWDnjjYyvY=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-JQIrQLWvMIW0dwlTmz753g-1; Wed, 14 Jul 2021 17:53:43 -0400
X-MC-Unique: JQIrQLWvMIW0dwlTmz753g-1
Received: by mail-ua1-f72.google.com with SMTP id
 y10-20020ab020aa0000b029029fe64e1166so750997ual.2
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 14:53:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2lFajJeamlR5QQ3qRZjfAfMZMSCCMl1uHbPwU/5XZKc=;
 b=X8YyyYcYc0ghOM/TunCIkwkOOf9ibumOZzYoUArPzMEDlTOmq73gtRk1DG/k2rkTXR
 pfGrx1TmQA5nY5ZiRJ8ZjVQj7P37Hl69OYeTmSbIRr0RjtPGwTWplTOiXh3pZcIFzv+J
 i67Y81+hkiKEA969xPzd+tUvsKxzqLcDAi1HNnFGoh0K+LR5tjtVbKEfsWHiqXuSy9Zg
 8pcj0RCyYlO/6P7KvFi3Pznhyg5ZzB9QB2dQJZ7vD7tmCTBO0eshECe01/v5wQ+Ao9Dg
 kSTd8nmbfzfgiFRn5+04d21j+n9z2bDZewdgLvqI7jxm41jktAyHhPiHpnaVDtcZbw4u
 zZpg==
X-Gm-Message-State: AOAM5324HyJT8SgzCvufbQmY3GZEWuo6Om9O4UTlJ5CoMgW3tyWgFsuW
 S/29aaToETy/KMkNoJKXXwJwSm4hB0zFlY8Jb1S6eOrwZNrmr8FSWHWVsz856hFy6FHpuLiHTbD
 NWmQRBu7UFa9baD18NA/+KRLOd2tMCZY=
X-Received: by 2002:a05:6102:3661:: with SMTP id
 bg1mr579174vsb.50.1626299623510; 
 Wed, 14 Jul 2021 14:53:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx249zCKyXOGhJnJp3eTHW3e0VlrWEemTRM2Mg4b87tOYjgGrxLxf2j6lOR1PJQZuxN4qEF0gVM58yVYOb9Pes=
X-Received: by 2002:a05:6102:3661:: with SMTP id
 bg1mr579164vsb.50.1626299623401; 
 Wed, 14 Jul 2021 14:53:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210714174051.28164-1-crosa@redhat.com>
 <20210714174051.28164-4-crosa@redhat.com>
In-Reply-To: <20210714174051.28164-4-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 14 Jul 2021 18:53:17 -0300
Message-ID: <CAKJDGDaRK4Z6XvHkKsdycW3pvN9Niaq7rrTT47NmwoHj4O6tCA@mail.gmail.com>
Subject: Re: [PATCH 3/6] tests/acceptance/virtio-gpu.py: combine CPU tags
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 14, 2021 at 2:41 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> Like previously done with the arch tags, all tests use the same CPU
> value so it's possible to combine them at the class level.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/virtio-gpu.py | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


