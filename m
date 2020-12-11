Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DF82D711D
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 08:55:16 +0100 (CET)
Received: from localhost ([::1]:39364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kndGl-00063T-0b
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 02:55:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kndFB-0005Jg-II
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 02:53:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kndF7-0000TK-K7
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 02:53:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607673212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3ygZh3jCLWy5/wnk97Uh+rTKp5B/bkSvshK06rmhNU4=;
 b=CwZw4Wc/JOgrFsmgGs57B1J5wE1Fa/KVeK9LxMJGyuR2YutwbQ+3GYKfgEad5a5TgudXnx
 Xwy+ZLasXD22oJPg7Weui1LpuGH1s0o2u/WH+GxVrDO6yzoYPQkSCGJZLfoLbl+Qva+j4R
 AAEIOdfGuJqw4cspq/gcZ0SyVYO8+kg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-bwlxianKPpaGIi_QUtHVTg-1; Fri, 11 Dec 2020 02:53:30 -0500
X-MC-Unique: bwlxianKPpaGIi_QUtHVTg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4352115725;
 Fri, 11 Dec 2020 07:53:28 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-76.ams2.redhat.com [10.36.113.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D5D726F989;
 Fri, 11 Dec 2020 07:53:15 +0000 (UTC)
Subject: Re: [PATCH v2 4/8] configure: add --without-default-features
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20201210190417.31673-1-alex.bennee@linaro.org>
 <20201210190417.31673-5-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <dad53fb4-8aa4-441b-1daa-01b635396ad4@redhat.com>
Date: Fri, 11 Dec 2020 08:53:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201210190417.31673-5-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, berrange@redhat.com, stefanb@linux.vnet.ibm.com,
 richard.henderson@linaro.org, f4bug@amsat.org, cota@braap.org,
 stefanha@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/2020 20.04, Alex Bennée wrote:
> By default QEMU enables a lot of features if it can probe and find the
> support libraries. It also enables a bunch of features by default.
> This patch adds the ability to build --without-default-features which
> can be paired with a --without-default-devices for a barely functional
> build.
> 
> The main use case for this is testing our build assumptions and for
> minimising the amount of stuff you build if you just want to test a
> particular feature on your relatively slow emulated test system.

This will likely also be very helpful for downstream distros like RHEL where
we also only want to enable a well-known set of supported features and
disable everything else by default. Thanks for tackling this!

...
> diff --git a/configure b/configure
> index 46fdea88c7..11f5878a59 100755
> --- a/configure
> +++ b/configure
> @@ -291,10 +291,22 @@ unset target_list_exclude
>  #
>  # Always add --enable-foo and --disable-foo command line args.
>  # Distributions want to ensure that several features are compiled in, and it
> -# is impossible without a --enable-foo that exits if a feature is not found.
> +# is impossible without a --enable-foo that exits if a feature is not
> +# found.

Why did you wrap the second long line, but not the first one?

> -brlapi=""
> -curl=""
> +default_feature=""
> +# parse CC options second
> +for opt do
> +  optarg=$(expr "x$opt" : 'x[^=]*=\(.*\)')
> +  case "$opt" in
> +      --without-default-features)
> +          default_feature="no"
> +  ;;
> +  esac
> +done
> +
> +brlapi="$default_feature"
> +curl="$default_feature"
>  iconv="auto"
>  curses="auto"
>  docs="auto"
> @@ -303,52 +315,52 @@ netmap="no"
>  sdl="auto"
>  sdl_image="auto"
>  virtiofsd="auto"
> -virtfs=""
> +virtfs="$default_feature"

So this currently only deals with the variables that are pre-initialized to
"" ... but what about those that are initialized to "auto" ? I think they
should be handled, too? Well, it can still be done in a later patch, I guess.

Acked-by: Thomas Huth <thuth@redhat.com>


