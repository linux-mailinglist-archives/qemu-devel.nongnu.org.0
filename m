Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 203C8348240
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 20:57:09 +0100 (CET)
Received: from localhost ([::1]:35640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP9cp-0002TW-HC
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 15:57:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lP9ah-0001uE-EY
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 15:54:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lP9ae-0008OY-LL
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 15:54:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616615690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=syld4BFkeb6z4DHLkQeOb2hYHIlhBrBMOmwmlmvo3P8=;
 b=YAf/br6RAmM1O9lN5Zd/cxINq2MFmhxew9c70XY5ZJEZqRyHBoDA1QgbxUl/vSJKbkbvXa
 plvQOmtvS/P37ScBcYNdRcflTjnZJkQ+xjViYt8hmIVZg+JCqu/lTPiR5dBnIgP6cwzkh4
 XI7Xsic7IXVKQ9rT43FLI5Gx4O/b9gA=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-EIBrdOqmMKuf7GI63hhEww-1; Wed, 24 Mar 2021 15:54:48 -0400
X-MC-Unique: EIBrdOqmMKuf7GI63hhEww-1
Received: by mail-vs1-f70.google.com with SMTP id p2so35431vsq.6
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 12:54:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=syld4BFkeb6z4DHLkQeOb2hYHIlhBrBMOmwmlmvo3P8=;
 b=ub1SWniNh4KIfRP2DvO8zdKavOPCvY8Y4qlntTJNlz8mlpvS+GVYT9yPODdwN2yuCP
 o1eIptR+ZAc53iUZ5qvb1uaOeUna+IeXQGSVCeki6YLYJgjG/Gxbz6B07b7ot/z0OdE+
 mnq3UOtN4vIUcC9fLfF/4aW6DWCFYrireNqFWCE/wzY2TmBqBHlmh9pCAcfZW3hJyQ82
 GauxX/1pV5+9WK4Z4nyk7H+hTG98YIT3Ho2l5iGqOHaeyMy+KXtu4iu80lZ1dRqiUZ+G
 gI6GJ/J0AhS42/C8oHLL/b1MO+v6gSZhfLBXHd/1DQp8wegviB1VsQws0H4onA27C/Oo
 ulOQ==
X-Gm-Message-State: AOAM531EOXw5cLaAluseWHAbCnnF1MMilmBG/1rkYrgrh9wyr/Eq3dju
 o3rWOO+fh3U9Id3Z6IDice7hfb0siqmg+ie3kxHygFh3ClOvVtPNPfXmKJXhvuc3o6AyMMyyIde
 AYj0i1u8XgJ1UdBIQVJi8zorZfXB1GrM=
X-Received: by 2002:a67:3241:: with SMTP id y62mr3176378vsy.45.1616615688131; 
 Wed, 24 Mar 2021 12:54:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzatgfNCCsrtdj18vED2mcVc0Ds7ZElGrypj8qYZ+t+lKFdJqHIf1ca0ctFtBgrfZ0ChPXuuU8irgZcN8NDqQM=
X-Received: by 2002:a67:3241:: with SMTP id y62mr3176356vsy.45.1616615687761; 
 Wed, 24 Mar 2021 12:54:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210323221539.3532660-1-crosa@redhat.com>
 <20210323221539.3532660-3-crosa@redhat.com>
In-Reply-To: <20210323221539.3532660-3-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 24 Mar 2021 16:54:22 -0300
Message-ID: <CAKJDGDbXnuPUm8s1dgDi4gTJki7kFM_w_qf-j5-T9Vz4OdzLww@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] tests/acceptance/virtiofs_submounts.py: evaluate
 string not length
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
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Willian Rampazzo <willianr@redhat.com>,
 Eric Auger <eauger@redhat.com>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 23, 2021 at 7:15 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> If the vmlinuz variable is set to anything that evaluates to True,
> then the respective arguments should be set.  If the variable contains
> an empty string, than it will evaluate to False, and the extra
> arguments will not be set.
>
> This keeps the same logic, but improves readability a bit.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> Reviewed-by: Beraldo Leal <bleal@redhat.com>
> ---
>  tests/acceptance/virtiofs_submounts.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


