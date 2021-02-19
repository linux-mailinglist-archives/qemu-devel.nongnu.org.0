Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A1431F9FD
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 14:37:57 +0100 (CET)
Received: from localhost ([::1]:48652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD5ym-0000qL-7o
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 08:37:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lD5rZ-00019b-DV
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 08:30:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lD5rW-0004wm-KR
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 08:30:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613741425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GGe5dL8u+Ctt51epItKddFMOg4hMr+I7EO7GtmqLw2o=;
 b=jDDxkJ4U+ALDaL5h129Rp6u2gi5iYXWy/6CXNmwMqtcpDB1piIJWTztUImtgOIo66PcJdQ
 BJ+mNScuDVLPsFGeKVIANsfgQLgzfITd9fX1ug3BHKQCtsqrMLpVRL4noaqTOD/Y1ILYH3
 FKYX1WolcjY4aXX4JnvPrZpXi8BxdEY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-D7LLROcINayBgT9ASNYlMw-1; Fri, 19 Feb 2021 08:30:23 -0500
X-MC-Unique: D7LLROcINayBgT9ASNYlMw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07810100A627;
 Fri, 19 Feb 2021 13:30:22 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-63.ams2.redhat.com [10.36.112.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 29BB75D720;
 Fri, 19 Feb 2021 13:30:20 +0000 (UTC)
Subject: Re: meson, NEED_CPU_H, CONFIG_TCG and tests/
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
References: <eb7d8eca-13ef-07cf-41b4-d7276399fff1@suse.de>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <a9f6fbf7-fb29-eca6-44f0-91381e8b3084@redhat.com>
Date: Fri, 19 Feb 2021 14:30:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <eb7d8eca-13ef-07cf-41b4-d7276399fff1@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/02/2021 14.04, Claudio Fontana wrote:
> Hi Paolo,
> 
> currently we have use of CONFIG_TCG in tests/,
> 
> but is that variable available at all in there?
> 
> I have to adapt some qemu/tests/qtest/* to work also without tcg for ARM,
> 
> but I think I am not seeing CONFIG_TCG filtering through, and I wonder whether all the checks in there are actually "wrong".
> 
> Looking at meson.build it would seem to me that only stuff in target/ would be able to see CONFIG_TCG,
> as a result of
> 
> foreach target : target_dirs
>    config_target = config_target_mak[target]
>    target_name = config_target['TARGET_NAME']
>    arch = config_target['TARGET_BASE_ARCH']
>    arch_srcs = [config_target_h[target]]
>    arch_deps = []
>    c_args = ['-DNEED_CPU_H',
>              '-DCONFIG_TARGET="@0@-config-target.h"'.format(target),
>              '-DCONFIG_DEVICES="@0@-config-devices.h"'.format(target)]
> 
> But how could tests see this?

The test are generic, not target-specific code, so they can not see things 
like NEED_CPU_H, of course.

But CONFIG_TCG seems to be defined in config-host.h, so you should be able 
to use that define, shouldn't you?

  Thomas


