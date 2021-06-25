Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6593B48D9
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 20:37:13 +0200 (CEST)
Received: from localhost ([::1]:33894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwqhU-0004YH-62
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 14:37:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lwqWO-00065b-18
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:25:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lwqWM-0000Fk-4G
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:25:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624645541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w3pkC6hCMWyQpJSmg9njMkvWEqFRUk8tzy3R0NR3ZNE=;
 b=B4IuHvA5FAzhzpjjSTkHhX77Sz/kG0Klc+iWwv8Va6WR7CczFYaqObyGw+KiBFiwwnSU0H
 aye5TPoUVSJlVkXUfYRwzakCowqe5JFamK/JlWOyoonLeeJqj4cWvd0XCsg8DrhCpETXKS
 FsGra9VFsj9MeIBbzQQujKuLYWPYGkw=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-ZmPS8Tq5MjemGmVNXLJR_w-1; Fri, 25 Jun 2021 14:25:39 -0400
X-MC-Unique: ZmPS8Tq5MjemGmVNXLJR_w-1
Received: by mail-ua1-f70.google.com with SMTP id
 42-20020ab003ad0000b0290287f748a168so2685487uau.21
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 11:25:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w3pkC6hCMWyQpJSmg9njMkvWEqFRUk8tzy3R0NR3ZNE=;
 b=AM8dhXPR4wblpchCsr6/tcfqORL7D5EPZNDVRYRAmrxXPlFnPvAQuI67qUxORUyH+x
 9aW8lwapDOzwOurZXGWLwq5+ai7NADt30iVtJAc8V8UcMROaWmXtcZKQ2nPF8lQyeGai
 0feLFTMJSyhTmlVaUu8Xyeka5+7UzUb3YDbNHdkcwWJWlPPTnAbOxR25XL9G9A2yN3jC
 IVCyKb8WWIX68aLyBLfDKbNmnDx0XZZhQzHMic171g3hcHMcbYmC2jcTjcHaeWgV16/v
 DQofz6CSLFgunEyXAo5HB0/ahheqT6rjiZYL+P55Fux5c02XESZ31yK34dXUBVkkyaT5
 xWzw==
X-Gm-Message-State: AOAM532oPW6xBhdMc6gCi19i0e6mfT5iY/Zm1fBiRUjvebp6h3df10J5
 LuLfHoUVJWYSSMR3EviKSDtKtAKEVSPZA1bXE4nMeIq8OFmlzVdRL28cKWJDIa47poXDzFanAkH
 m3VXmplFDtMCLVTAgVI9T/Q6T3WsXZd0=
X-Received: by 2002:a67:fa0a:: with SMTP id i10mr10657376vsq.45.1624645539431; 
 Fri, 25 Jun 2021 11:25:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwb8W/tygevrCCljUJ0cahnNQNcrLt1pQ4mkTYVzF3O8uO5vCosh/zex1U9kdLcBeRUKyJBHAleGXdpqHZXi18=
X-Received: by 2002:a67:fa0a:: with SMTP id i10mr10657235vsq.45.1624645538033; 
 Fri, 25 Jun 2021 11:25:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210625154540.783306-1-jsnow@redhat.com>
 <20210625154540.783306-6-jsnow@redhat.com>
In-Reply-To: <20210625154540.783306-6-jsnow@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 25 Jun 2021 15:25:12 -0300
Message-ID: <CAKJDGDZ8Fw2YYUL+XRH74bA0kM71dhOf+ugBB6g5F2eCL4nH7w@mail.gmail.com>
Subject: Re: [PATCH 05/11] python: Add no-install usage instructions
To: John Snow <jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 25, 2021 at 12:46 PM John Snow <jsnow@redhat.com> wrote:
>
> It's not encouraged, but it's legitimate to want to know how to do.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/README.rst | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


