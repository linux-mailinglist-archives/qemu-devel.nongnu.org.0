Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E90B31C2CC
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 21:08:42 +0100 (CET)
Received: from localhost ([::1]:59904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBkAj-0000tu-6H
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 15:08:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lBk8Z-0000PR-5y
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 15:06:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lBk8Q-0006Y3-Ps
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 15:06:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613419577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xk5JtItFuF2hxo5/fZ6SqUdKA8mDcsjncQdPoGrNh4c=;
 b=Pa9ovUj7YmZ5gNpYIWVwpoTGNJq+NIn1LcguGsKwfDrZIbs0cV4haAGrg/L9ZkoTuxAUsx
 rXgph//8NnhP6K8KD54U6Rt/BDLta9Ffmo3EE+HaYROdVWOAx7MCYl/gswsJie+3eYodGC
 4IAB7iKloYYzjiJ2ynsBa33cA/g4zk0=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-6qBB30p4OFK0BV_yinmqog-1; Mon, 15 Feb 2021 15:06:13 -0500
X-MC-Unique: 6qBB30p4OFK0BV_yinmqog-1
Received: by mail-vk1-f199.google.com with SMTP id n196so1347362vkn.23
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 12:06:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xk5JtItFuF2hxo5/fZ6SqUdKA8mDcsjncQdPoGrNh4c=;
 b=Fr1qQ14O7i8mbyhs7bafLvM977XNR1u3/NnGnjLSHN30s2K6oWeJtqTu+o6WgIu/z9
 bAlahyR7CzyO30fUkRL7fLzHkYY2S/ZjZ0rbr65xTDlH5dPcCUcJoCqh32Q/lDzplisZ
 9Y5rEQO+q90EmfmaK/K63Xh/U1X1HuYBAGvkluBPJfbbUIZkQWjZNc2oOck5bjFgWRJQ
 yYwdxh/qXA9Zm209p+NNPOSNmcH6HR8PEkgAxkp5FbMsXudd/awSeCHe9nVM3bX82JGP
 LW9o/DIv2NAYljhkX9QHqwYJdePx5CmCShzjgLAq/w6rPUlRueiw4iRCHwUz9B0rs9yr
 2ZHQ==
X-Gm-Message-State: AOAM530vJGYh29+mr8c712rnFIsP6mb8LI9bRkdM0etlXqFZD/a4sKuR
 mW6RYVvpBpEtJhRVV3IVGaNwvJZpzXEaLTFZHik6sqvisOeqFpqHzN0hmtp/NeYkFhTct7kZo9g
 bIieCt5NJBoVrb4qS6Ez1E8F+JfnbHz4=
X-Received: by 2002:a05:6102:822:: with SMTP id
 k2mr4954379vsb.50.1613419573298; 
 Mon, 15 Feb 2021 12:06:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxM5NpoUCwS1w0kbUP7LdJ/C0WKIf5mBzghCUy8Il6/ubzvziaqdkrPLiRkrqOynhukUCgIQZJUstimp51X8EQ=
X-Received: by 2002:a05:6102:822:: with SMTP id
 k2mr4954357vsb.50.1613419573036; 
 Mon, 15 Feb 2021 12:06:13 -0800 (PST)
MIME-Version: 1.0
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-14-crosa@redhat.com>
In-Reply-To: <20210203172357.1422425-14-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 15 Feb 2021 17:05:47 -0300
Message-ID: <CAKJDGDbeQ6QKp9RXuFEBnFS_PCbaAF-YRXzYpVR_08PPESx2tA@mail.gmail.com>
Subject: Re: [PATCH 13/22] tests/acceptance/virtiofs_submounts.py: add missing
 accel tag
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 John Snow <jsnow@redhat.com>, Eric Auger <eauger@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 3, 2021 at 2:24 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> Which is useful to select tests that depend/use a particular feature.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/virtiofs_submounts.py | 1 +
>  1 file changed, 1 insertion(+)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


