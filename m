Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0792940CE
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 18:49:32 +0200 (CEST)
Received: from localhost ([::1]:45148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUupH-0005n0-TN
	for lists+qemu-devel@lfdr.de; Tue, 20 Oct 2020 12:49:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kUuEP-00068Z-Lz
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 12:11:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kUuEM-0005nP-Ge
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 12:11:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603210279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hMdFmKf+4yJFeTkE1CsBn2wUg37eYQjXzxR2R0WcwOk=;
 b=ABi6SyuHQ210rua5X+N6BcpQlbcJA0HjcTegRVN85PMvJoSosmePfA/i69xPHBDj7eP/vi
 fNoRMjkHwpcCglMfv0w7rqFkbbp2OaEC7nacE4URp/qPgKgLk/Kq4iItZrQaCTOLPRNnkY
 zcZKZN3s9Epyeog7nonRwH9W7/s4weo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-nE5q74F8O0eOWsNQPazE-A-1; Tue, 20 Oct 2020 12:11:17 -0400
X-MC-Unique: nE5q74F8O0eOWsNQPazE-A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D80198CD5BD;
 Tue, 20 Oct 2020 16:10:56 +0000 (UTC)
Received: from [10.10.115.172] (ovpn-115-172.rdu2.redhat.com [10.10.115.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B98EB5B4A1;
 Tue, 20 Oct 2020 16:10:55 +0000 (UTC)
Subject: Re: [PATCH v2] Remove deprecated -no-kvm option
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20201020160504.62460-1-thuth@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <507d30ee-dd62-acd6-883a-73b3a052ca45@redhat.com>
Date: Tue, 20 Oct 2020 12:10:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201020160504.62460-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 01:15:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, libvir-list@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/20/20 12:05 PM, Thomas Huth wrote:
> The option has never been mentioned in our documentation, it's been
> deprecated since years, it's marked with QEMU_ARCH_I386 (which does
> not make sense anymore since KVM is available on other architectures,
> too), it does not do anything by default in upstream QEMU (since TCG
> is the default here anyway), and we're spending too much precious time
> each year discussing whether it makes sense to keep this option as a
> nice suger or not... let's finally put an end on this and remove it.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   v2: Mention the parameter in the "removed feature" section (thanks Paolo!)
> 
>   docs/system/deprecated.rst | 11 ++++++-----
>   qemu-options.hx            |  3 ---
>   softmmu/vl.c               |  4 ----
>   3 files changed, 6 insertions(+), 12 deletions(-)
> 
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index 905628f3a0..9bae13bc01 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -27,11 +27,6 @@ System emulator command line arguments
>   The ``enforce-config-section`` parameter is replaced by the
>   ``-global migration.send-configuration={on|off}`` option.
>   
> -``-no-kvm`` (since 1.3.0)
> -'''''''''''''''''''''''''
> -
> -The ``-no-kvm`` argument is now a synonym for setting ``-accel tcg``.
> -
>   ``-usbdevice`` (since 2.10.0)
>   '''''''''''''''''''''''''''''
>   
> @@ -504,6 +499,12 @@ System emulator command line arguments
>   The ``name`` parameter of the ``-net`` option was a synonym
>   for the ``id`` parameter, which should now be used instead.
>   
> +``-no-kvm`` (removed in 5.2)
> +''''''''''''''''''''''''''''
> +
> +The ``-no-kvm`` argument was a synonym for setting ``-accel tcg``.
> +
> +
>   QEMU Machine Protocol (QMP) commands
>   ------------------------------------
>   
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 1da52a269c..9e1ace04f7 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4351,9 +4351,6 @@ SRST
>       Enable FIPS 140-2 compliance mode.
>   ERST
>   
> -HXCOMM Deprecated by -accel tcg
> -DEF("no-kvm", 0, QEMU_OPTION_no_kvm, "", QEMU_ARCH_I386)
> -
>   DEF("msg", HAS_ARG, QEMU_OPTION_msg,
>       "-msg [timestamp[=on|off]][,guest-name=[on|off]]\n"
>       "                control error message format\n"
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index cb476aa70b..6f5b000f07 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -3502,10 +3502,6 @@ void qemu_init(int argc, char **argv, char **envp)
>                       exit(1);
>                   }
>                   break;
> -             case QEMU_OPTION_no_kvm:
> -                olist = qemu_find_opts("machine");
> -                qemu_opts_parse_noisily(olist, "accel=tcg", false);
> -                break;
>               case QEMU_OPTION_accel:
>                   accel_opts = qemu_opts_parse_noisily(qemu_find_opts("accel"),
>                                                        optarg, true);
> 

One down, 130 to go? *g*

Reviewed-by: John Snow <jsnow@redhat.com>


