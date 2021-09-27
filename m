Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D704196B3
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 16:48:56 +0200 (CEST)
Received: from localhost ([::1]:49150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUrw7-0007S9-HF
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 10:48:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUrom-0007a2-Ba
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 10:41:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUrol-0003cY-1H
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 10:41:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632753674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Ju9WCcoP1DZoQHD8A1PVK2PeVmL89PxeGr45vu0bR4=;
 b=QA01zUxU+Gygg6hwuffVaa4vulucO59DDed4Z9uxKBfHYfB4/mxKbffOLdQQey9qGKU+v/
 QHyApD35U6I7sL72fs/HxbRtgyBfs3+nbEvsMMHhjcl8Bb7uw+y31gn1mi8sJEMxQY4FfK
 sPfOjah7Z7in6LYJ6snbduG10WRASvI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-1Q0dwSYIOZqx3uT_iVdm8w-1; Mon, 27 Sep 2021 10:41:11 -0400
X-MC-Unique: 1Q0dwSYIOZqx3uT_iVdm8w-1
Received: by mail-wr1-f71.google.com with SMTP id
 c8-20020adfef48000000b00160646ed62cso2579174wrp.18
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 07:41:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+Ju9WCcoP1DZoQHD8A1PVK2PeVmL89PxeGr45vu0bR4=;
 b=vwElmsgNTeZciSHstk7zVjCxsFZhqGC7NEhkBWm4xS1OgmskGQBL1Jlf+6LN2Eklxn
 TrxDr+MOKPjGzW6zYZqu12r4VpoCj4rudVV/J1wUy9Kjigi2PYi6hlp0pxM8DnpHQd9C
 Q0EtrGzZ9nQc15ovYhpAUBdGgIYr/WFwWodxTyest5O3AdJRORgra+z4QUDxaQIfRIZm
 qYccfSqagQta30fc6bqZFRUI0B1SH3uQyb9Io2bffDs3KtwnPQM7bYvG4LudvwXfjvcW
 fEvwK9xjmzFfxjcfRqzhVned9hW4FcXxITs/R9dGcjoDPFWiSNDi9FADkQXLN/Ioc6MI
 YFBQ==
X-Gm-Message-State: AOAM530y2Hwg4ysJIZ8RGjwS328ORWM5inNVhuyVPaYzl1UD+HvHKNgB
 fz3dEh/GGU3kJY92qk4w40tRZx2vvwRWSe0cWfbXf/1qcZDXB39PFFoDnwLAG1etg4t7Y90VHar
 MVGMN4/XM07D+N5E=
X-Received: by 2002:a5d:4950:: with SMTP id r16mr168400wrs.265.1632753670457; 
 Mon, 27 Sep 2021 07:41:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyV82jgQuvu4NrwXYw+NsZjmNpooDF/ZuAfKgpaJ7wsEbarxzI1YIQGsN4b9K+Dndg2X9MZuA==
X-Received: by 2002:a5d:4950:: with SMTP id r16mr168370wrs.265.1632753670332; 
 Mon, 27 Sep 2021 07:41:10 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id b7sm20613907wrm.9.2021.09.27.07.41.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 07:41:09 -0700 (PDT)
Message-ID: <28184689-fed8-c448-bc38-6e68da51c77a@redhat.com>
Date: Mon, 27 Sep 2021 16:41:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 08/16] acceptance/tests/vnc.py: use explicit syntax for
 enabling passwords
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210924185506.2542588-1-crosa@redhat.com>
 <20210924185506.2542588-9-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210924185506.2542588-9-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.136, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Willian Rampazzo <wrampazz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/21 20:54, Cleber Rosa wrote:
> This matches the command line on 82a17d1d67, where the "on" or "off"
> should be explicitly given.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/vnc.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


