Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCD726BE95
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Sep 2020 09:57:04 +0200 (CEST)
Received: from localhost ([::1]:45626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kISJL-0008Cr-8Z
	for lists+qemu-devel@lfdr.de; Wed, 16 Sep 2020 03:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kISHg-0007et-OR
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 03:55:20 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29095
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kISHf-0001gl-1X
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 03:55:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600242913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YJiSJ1lVWGRxmyW0LCPGoJ2ellUktlRZFZpXjhQnt/s=;
 b=MEDLjM1midWgGM9LFjglYuanUiNOIlL6l7kS0thFmpKwRmePIicvMrGEcfbX5sYyWU7apL
 K/iuI6RIDEgQDLZVl2rcgB+zFcSg1OBCGnXkcZ22xcGbjolx/Krx+cbQyHD72PSMUp3PgW
 LbIFJnQXIYTlVc9sKV7AGpgvOsJM1oE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-vmcm_FtSPXCEr21b0VrKSQ-1; Wed, 16 Sep 2020 03:55:12 -0400
X-MC-Unique: vmcm_FtSPXCEr21b0VrKSQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B30991074672;
 Wed, 16 Sep 2020 07:54:35 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-19.ams2.redhat.com [10.36.113.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3FE5C1014160;
 Wed, 16 Sep 2020 07:54:33 +0000 (UTC)
Subject: Re: Python 3.5 EOL; when can require 3.6?
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <875z8eupyp.fsf@dusky.pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <1ad049f0-09f9-d56f-bc63-d120a0dbcf24@redhat.com>
Date: Wed, 16 Sep 2020 09:54:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <875z8eupyp.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 02:37:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/09/2020 09.43, Markus Armbruster wrote:
> We require Python 3.5.  It will reach its "end of life" at the end of
> September 2020[*].  Any reason not to require 3.6 for 5.2?  qemu-iotests
> already does for its Python parts.

I think the only reason for requiring Python 3.5 is that we still use
Ubuntu Xenial in Travis. We don't support Xenial according to our
support policy anymore, but we did not update to Bionic there since it
has that broken version of libssh.

Fortunately, since a couple of weeks, Travis now supports Focal, too, so
once we switched our .travis.yml to use Focal, I think we could start
requiring Python 3.6.

 Thomas


