Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3288D3B59CD
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 09:33:17 +0200 (CEST)
Received: from localhost ([::1]:46854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxllc-00049j-9P
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 03:33:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lxlhw-0007vd-42
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 03:29:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lxlhu-0001XN-6b
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 03:29:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624865363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/8t2rBvxAJVBCFp9NhUtYp/qqHCS/ZBRKQ67Z9mey/Q=;
 b=hv1wy6f6DDKIkJPxdsWzJwC338pCyd7jZx0apOjeDzNUqscvS70m+IAwL9lW+dpZQG9MhZ
 x64yuSBXAEWzL+qhBMiW8h14uzoL1VHyL+GAJlkA/xwAZYx5o3KXgXbKGAoPAaumMbsHvt
 3j+ZmrNL8ox1gB1DLNPN8bGorRJ6/K8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-uzkN4PWvNvOatEmiu57oig-1; Mon, 28 Jun 2021 03:29:19 -0400
X-MC-Unique: uzkN4PWvNvOatEmiu57oig-1
Received: by mail-wm1-f72.google.com with SMTP id
 z127-20020a1c7e850000b02901e46e4d52c0so4726459wmc.6
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 00:29:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/8t2rBvxAJVBCFp9NhUtYp/qqHCS/ZBRKQ67Z9mey/Q=;
 b=I8dZyvN/A1rjMFqsoJvImRixIs5xhnGd3mupPjJGxGfVwOG+5LlwknYOjz/ySRF151
 Ma4szPjRCnnqPbtJlVBDuOq3crkWxVAR/dOrcHGlfRFvJ2kJkUDw7I1VAl8VS+EnjgaV
 /DrQz8xmx5e9e/FNA333GwVGlGVT8FlTur8bR8ZPChOoSa27n7bbs8IhNdacEjxznCwj
 nb1aBF5cR5d2aW5i/q7VSre68sWWU1aTro19yo6f4rUqCpsOoyrMc9ksCI/cirTZta0W
 EFevTDdYhDNifjFSZ+jMm7wL3F89Dxbnd1c16PxiBrEERxo1nrEOImvmRCcBsU8BSaOu
 8iSQ==
X-Gm-Message-State: AOAM531zUvLv3Q/AQK/OZ5q/GGdQMJbkuw4EIiAUw4NIrwE4H9YddO7q
 bi0s3LFryq2DAroz5T12jCnD0nsKWLtIQpxd2A1hn4+f9wPxTvXY2pytX2qwxKzXKjabl+k/tT3
 q4hU3JAldqExTmyw=
X-Received: by 2002:a7b:c0d6:: with SMTP id s22mr24392017wmh.52.1624865358111; 
 Mon, 28 Jun 2021 00:29:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCxk8/FeN6botVPypJp8Y62MOK8/2Tt7Ie6Xp6xdbJtivM/aipquAkAGFo0xIJbY0fWZR1Vg==
X-Received: by 2002:a7b:c0d6:: with SMTP id s22mr24392000wmh.52.1624865357939; 
 Mon, 28 Jun 2021 00:29:17 -0700 (PDT)
Received: from thuth.remote.csb (pd9575ea7.dip0.t-ipconnect.de.
 [217.87.94.167])
 by smtp.gmail.com with ESMTPSA id n8sm20211205wmc.45.2021.06.28.00.29.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 00:29:17 -0700 (PDT)
Subject: Re: [PATCH 3/3] cirrus: delete FreeBSD and macOS jobs
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210625172211.451010-1-berrange@redhat.com>
 <20210625172211.451010-4-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <f82b1366-a505-ae0c-e218-5560231ca6b0@redhat.com>
Date: Mon, 28 Jun 2021 09:29:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625172211.451010-4-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.696,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.765, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Ed Maste <emaste@freebsd.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/06/2021 19.22, Daniel P. Berrangé wrote:
> The builds for these two platforms can now be performed from GitLab CI
> using cirrus-run.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   .cirrus.yml | 55 -----------------------------------------------------
>   1 file changed, 55 deletions(-)
> 
> diff --git a/.cirrus.yml b/.cirrus.yml
> index f4bf49b704..02c43a074a 100644
> --- a/.cirrus.yml
> +++ b/.cirrus.yml
> @@ -1,61 +1,6 @@
>   env:
>     CIRRUS_CLONE_DEPTH: 1
>   
> -freebsd_12_task:
> -  freebsd_instance:
> -    image_family: freebsd-12-2
> -    cpu: 8
> -    memory: 8G
> -  install_script:
> -    - ASSUME_ALWAYS_YES=yes pkg bootstrap -f ;
> -    - pkg install -y bash curl cyrus-sasl git glib gmake gnutls gsed
> -          nettle perl5 pixman pkgconf png usbredir ninja
> -  script:
> -    - mkdir build
> -    - cd build
> -    # TODO: Enable gnutls again once FreeBSD's libtasn1 got fixed
> -    # See: https://gitlab.com/gnutls/libtasn1/-/merge_requests/71
> -    - ../configure --enable-werror --disable-gnutls
> -      || { cat config.log meson-logs/meson-log.txt; exit 1; }
> -    - gmake -j$(sysctl -n hw.ncpu)
> -    - gmake -j$(sysctl -n hw.ncpu) check V=1
> -
> -macos_task:
> -  osx_instance:
> -    image: catalina-base
> -  install_script:
> -    - brew install pkg-config python gnu-sed glib pixman make sdl2 bash ninja
> -  script:
> -    - mkdir build
> -    - cd build
> -    - ../configure --python=/usr/local/bin/python3 --enable-werror
> -                   --extra-cflags='-Wno-error=deprecated-declarations'
> -                   || { cat config.log meson-logs/meson-log.txt; exit 1; }
> -    - gmake -j$(sysctl -n hw.ncpu)
> -    - gmake check-unit V=1
> -    - gmake check-block V=1
> -    - gmake check-qapi-schema V=1
> -    - gmake check-softfloat V=1
> -    - gmake check-qtest-x86_64 V=1
> -
> -macos_xcode_task:
> -  osx_instance:
> -    # this is an alias for the latest Xcode
> -    image: catalina-xcode
> -  install_script:
> -    - brew install pkg-config gnu-sed glib pixman make sdl2 bash ninja
> -  script:
> -    - mkdir build
> -    - cd build
> -    - ../configure --extra-cflags='-Wno-error=deprecated-declarations' --enable-modules
> -                   --enable-werror --cc=clang || { cat config.log meson-logs/meson-log.txt; exit 1; }
> -    - gmake -j$(sysctl -n hw.ncpu)
> -    - gmake check-unit V=1
> -    - gmake check-block V=1
> -    - gmake check-qapi-schema V=1
> -    - gmake check-softfloat V=1
> -    - gmake check-qtest-x86_64 V=1
> -
>   windows_msys2_task:
>     timeout_in: 90m
>     windows_container:
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


