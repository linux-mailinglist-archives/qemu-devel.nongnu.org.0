Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 030B3483818
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 21:53:19 +0100 (CET)
Received: from localhost ([::1]:37548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4UKU-0004fI-55
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 15:53:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n4UJc-0003xa-M3
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 15:52:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n4UJY-0001xv-8B
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 15:52:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641243138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ABU3XNj2HJ7n7M9kme8C3z7FRWvYadGdaNCEPuF0wM8=;
 b=YEu9qnqCHQoY1wwe9btXBBYCgXmHB6qdmRc2lQCwhuMzNxkD5q1MtC6rI4SQN//nLQ6t3N
 9LsXA7lYsnmHLIWmaaINe4VpXjbw2Lbm0eWQxYYEcvc/ocAiEylzeSCREebEIvvDo7M4uY
 E92g9DGyyzfam6JNlu7wOiEbT3TknUI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-202-9vTUfndbPyKu97sChjt7bA-1; Mon, 03 Jan 2022 15:52:17 -0500
X-MC-Unique: 9vTUfndbPyKu97sChjt7bA-1
Received: by mail-wr1-f72.google.com with SMTP id
 w25-20020adf8bd9000000b001a255212b7cso10663769wra.18
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 12:52:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ABU3XNj2HJ7n7M9kme8C3z7FRWvYadGdaNCEPuF0wM8=;
 b=LF+SMIULXVDvF+CnpVDVrx6kN1nHz7b5Bc9FrerI01zCfaql5axuEibW9Mfx0al/HL
 KGxJdY0sTvBMjVsE6th/Z2n1mqIK+mbjnK4vjC/skhd+ixnpvUP0GQOOfnauZKqWfYCQ
 jzaGVuX4I86Z6oz9pFs/hbOtyIyXRXlnKvTtwbu1PF0eaeQNVS8GRr2NK+6ULBu9rI5X
 bdi2FJeHlXQCwLh5r9owcgT696dkQdxHQuRc9W+eLtet4Yoa5knhWw9o2KBz0qIyUoJd
 HYO3X8bqcUbG92pcsuZLE2CDk5aMNUb0ci5NA0ypfsAuqHZ7H0mHBrFL41xb6+lIAqKE
 EMdg==
X-Gm-Message-State: AOAM531g2pEOemW75mfpw+/xWUr9vRjt7WV/sK8ffH0MuLXMYfEZjb6w
 G7QBeV3zLu6zfM6fG8e4tZS0BND5HLFyvip6b0khtHPgJV19BHh7dH2ILT7JC1A670KL4Gpc8By
 1bzZ2/Gy37fu/jc4=
X-Received: by 2002:a05:6000:124a:: with SMTP id
 j10mr39181612wrx.110.1641243136509; 
 Mon, 03 Jan 2022 12:52:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJziA/OILY4en/D6/Bj9e6A2hrbVBEtHW2n7oKR0+Jg/T62ae0WoTn7QB020jQIOW/44OTKD8g==
X-Received: by 2002:a05:6000:124a:: with SMTP id
 j10mr39181598wrx.110.1641243136312; 
 Mon, 03 Jan 2022 12:52:16 -0800 (PST)
Received: from [192.168.8.100] (tmo-098-68.customers.d1-online.com.
 [80.187.98.68])
 by smtp.gmail.com with ESMTPSA id c13sm35040262wrt.114.2022.01.03.12.52.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 12:52:15 -0800 (PST)
Message-ID: <a051554a-cd93-dc87-33ad-d3fd15142af2@redhat.com>
Date: Mon, 3 Jan 2022 21:52:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PULL v2 20/36] docs/sphinx: add sphinx modules to include D-Bus
 documentation
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20211221065855.142578-1-marcandre.lureau@redhat.com>
 <20211221065855.142578-21-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211221065855.142578-21-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/12/2021 07.58, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Add a new dbus-doc directive to import D-Bus interfaces documentation
> from the introspection XML. The comments annotations follow the
> gtkdoc/kerneldoc style, and should be formatted with reST.
> 
> Note: I realize after the fact that I was implementing those modules
> with sphinx 4, and that we have much lower requirements. Instead of
> lowering the features and code (removing type annotations etc), let's
> have a warning in the documentation when the D-Bus modules can't be
> used, and point to the source XML file in that case.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   docs/conf.py               |   8 +
>   docs/sphinx/dbusdoc.py     | 166 +++++++++++++++
>   docs/sphinx/dbusdomain.py  | 406 +++++++++++++++++++++++++++++++++++++
>   docs/sphinx/dbusparser.py  | 373 ++++++++++++++++++++++++++++++++++
>   docs/sphinx/fakedbusdoc.py |  25 +++
>   5 files changed, 978 insertions(+)
>   create mode 100644 docs/sphinx/dbusdoc.py
>   create mode 100644 docs/sphinx/dbusdomain.py
>   create mode 100644 docs/sphinx/dbusparser.py
>   create mode 100644 docs/sphinx/fakedbusdoc.py
> 
> diff --git a/docs/conf.py b/docs/conf.py
> index 763e7d243448..e79015975e6a 100644
> --- a/docs/conf.py
> +++ b/docs/conf.py
> @@ -73,6 +73,12 @@
>   # ones.
>   extensions = ['kerneldoc', 'qmp_lexer', 'hxtool', 'depfile', 'qapidoc']
>   
> +if sphinx.version_info[:3] > (4, 0, 0):
> +    tags.add('sphinx4')
> +    extensions += ['dbusdoc']
> +else:
> +    extensions += ['fakedbusdoc']
> +
>   # Add any paths that contain templates here, relative to this directory.
>   templates_path = [os.path.join(qemu_docdir, '_templates')]
>   
> @@ -311,3 +317,5 @@
>   kerneldoc_srctree = os.path.join(qemu_docdir, '..')
>   hxtool_srctree = os.path.join(qemu_docdir, '..')
>   qapidoc_srctree = os.path.join(qemu_docdir, '..')
> +dbusdoc_srctree = os.path.join(qemu_docdir, '..')
> +dbus_index_common_prefix = ["org.qemu."]

This does not work with my version of Sphinx (v 1.7.6):

Program sphinx-build-3 found: YES (/usr/bin/sphinx-build-3)
../../home/thuth/devel/qemu/docs/meson.build:30: WARNING: 
/usr/bin/sphinx-build-3:
Extension error:
Could not import extension fakedbusdoc (exception: cannot import name 
'SphinxDirective')

Any ideas how to fix it?

  Thomas



