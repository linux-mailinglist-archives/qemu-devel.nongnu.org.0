Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B79AD48D31A
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 08:47:55 +0100 (CET)
Received: from localhost ([::1]:49598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7upu-0000E1-HU
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 02:47:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n7uhh-0005RD-GA
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 02:39:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n7uhe-0006zM-9E
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 02:39:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642059553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/5MzpJoEoExnJKph4196dB75zix8p1TQyZGrInk/RhM=;
 b=JJeXy2Utc1XSCZf2sFXyEd1fKFDsD8UOCBGo7kfa7KMLws2bxma/vs6nwCD37cA6ic1Zb2
 RSDsJhWI0UCavI9USE/eE2MILPMo+gW1vHKUyz3JK7wfOf8KjwJ+n8z7nkR7XvdplkAsOX
 bV2IiydqFyUDx4UPrqTSTR0+TaDAarQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-sZev7X4mNw23sZfmP8bvjQ-1; Thu, 13 Jan 2022 02:39:11 -0500
X-MC-Unique: sZev7X4mNw23sZfmP8bvjQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 p7-20020a05600c1d8700b0034a0c77dad6so3178934wms.7
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 23:39:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/5MzpJoEoExnJKph4196dB75zix8p1TQyZGrInk/RhM=;
 b=6h9ortPvLgb6mb8wgJ6iAoutrY0KUSBfAijfOkpHeqwHFBWRV/dqSbjsqIiHhQ1PJ9
 ChMggzfeMbn2Kr1OsK+yrlHXQxwsLNLUpVSHudr6aIMsWzSEFilYpnzZMcImOFTtMak0
 kw1pcvs8dvzM4A6UA7Zx+f//cg2E59FTfSSF1h0El2wPGAiHxkRZQESvQWDns5OjIhZs
 G5XgOukFbMUNsKTXozQ3B+Q45OJa9O9JGKxMVY4U+P8cGa+u3UVAkMheFyYGjz0FGIPt
 j5GDbNvbJ2sgaY9JkIWurAcqnY+/Run4KGsI3uQwakoKlSVjDIsqYjD1LNmu5jHA9qCe
 SLsA==
X-Gm-Message-State: AOAM53387eH4gX4HkXkLWBdUmy67oFDJ2joJQUpeAxOqt2R6qAeNJyKc
 qg7kGROwOlZSi1yVUOlAn/jJImr1WjRji4jAFeY6+028d9xjEk19v1XBThBGb7R+j/eQWJHxL5U
 vjO7sNiAR1RSt1Ts=
X-Received: by 2002:a05:6000:168e:: with SMTP id
 y14mr2883118wrd.492.1642059550573; 
 Wed, 12 Jan 2022 23:39:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvNkT6A44so7lh4uFZ0vPRV2ZSja6XTyxZCNEBpRytJRlZWzdFUKQzTz9XXj/Oacn4E09RSQ==
X-Received: by 2002:a05:6000:168e:: with SMTP id
 y14mr2883094wrd.492.1642059550374; 
 Wed, 12 Jan 2022 23:39:10 -0800 (PST)
Received: from [192.168.42.76] (tmo-065-240.customers.d1-online.com.
 [80.187.65.240])
 by smtp.gmail.com with ESMTPSA id z6sm2052608wmp.9.2022.01.12.23.39.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 23:39:10 -0800 (PST)
Message-ID: <c3c894b5-e6a6-d203-83c6-07c15982c281@redhat.com>
Date: Thu, 13 Jan 2022 08:39:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH v3 7/7] gitlab-ci: Support macOS 12 via cirrus-run
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220110131001.614319-1-f4bug@amsat.org>
 <20220110131001.614319-8-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220110131001.614319-8-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/01/2022 14.10, Philippe Mathieu-Daudé wrote:
> Add support for macOS 12 build on Cirrus-CI, similarly to commit
> 0e103a65ba1 ("gitlab: support for ... macOS 11 via cirrus-run").
> 
> Update the lcitool repository to get the macos12 mappings,
> and generate the vars file by calling 'make lcitool-refresh'.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Pending on libvirt-ci MR #210:
> https://gitlab.com/libvirt/libvirt-ci/-/merge_requests/210
> ---
>   .gitlab-ci.d/cirrus.yml           | 15 +++++++++++++++
>   .gitlab-ci.d/cirrus/macos-12.vars | 16 ++++++++++++++++
>   tests/lcitool/libvirt-ci          |  2 +-
>   tests/lcitool/refresh             |  1 +
>   4 files changed, 33 insertions(+), 1 deletion(-)
>   create mode 100644 .gitlab-ci.d/cirrus/macos-12.vars
> 
> diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
> index b96b22e2697..b7662959070 100644
> --- a/.gitlab-ci.d/cirrus.yml
> +++ b/.gitlab-ci.d/cirrus.yml
> @@ -87,6 +87,21 @@ x64-macos-11-base-build:
>       PKG_CONFIG_PATH: /usr/local/opt/curl/lib/pkgconfig:/usr/local/opt/ncurses/lib/pkgconfig:/usr/local/opt/readline/lib/pkgconfig
>       TEST_TARGETS: check-unit check-block check-qapi-schema check-softfloat check-qtest-x86_64
>   
> +x64-macos-12-base-build:
> +  extends: .cirrus_build_job
> +  variables:
> +    NAME: macos-12
> +    CIRRUS_VM_INSTANCE_TYPE: osx_instance
> +    CIRRUS_VM_IMAGE_SELECTOR: image
> +    CIRRUS_VM_IMAGE_NAME: monterey-base
> +    CIRRUS_VM_CPUS: 12
> +    CIRRUS_VM_RAM: 24G
> +    UPDATE_COMMAND: brew update
> +    INSTALL_COMMAND: brew install
> +    PATH_EXTRA: /usr/local/opt/ccache/libexec:/usr/local/opt/gettext/bin
> +    PKG_CONFIG_PATH: /usr/local/opt/curl/lib/pkgconfig:/usr/local/opt/ncurses/lib/pkgconfig:/usr/local/opt/readline/lib/pkgconfig
> +    TEST_TARGETS: check-unit check-block check-qapi-schema check-softfloat check-qtest-x86_64

Since we cannot run that many Cirrus-CI jobs in parallel, I think it might 
make sense to limit the macos-11 job to manual mode now?

  Thomas



