Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D752E374CD9
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 03:29:11 +0200 (CEST)
Received: from localhost ([::1]:42266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leSpC-00016B-BK
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 21:29:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1leSnS-0000eO-1t
 for qemu-devel@nongnu.org; Wed, 05 May 2021 21:27:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1leSnK-0007nw-Ro
 for qemu-devel@nongnu.org; Wed, 05 May 2021 21:27:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620264431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gGiUiY18wEkn/MzXYy1ahSkOzMw+ba3QwNonFgfg1uU=;
 b=MnUxQ/1Hfjjc2cHRhfb9dMY7x/xF/RFlHEAA+vPGU+Zbp6V+fi8AC3g3VSIqmqHTVknJys
 ixVxJpb37CTbNvCfedkPEgxneaNSLrjwP4hgzpfZtc2uE2OsTC4ebcVOBj3Eb0WtJxWz6T
 bNgZadXaEFNawJ0yDcW8XRQHaeeLGAY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-k0ssmw1aOwS917icXwfg5g-1; Wed, 05 May 2021 21:27:09 -0400
X-MC-Unique: k0ssmw1aOwS917icXwfg5g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FDD85020A;
 Thu,  6 May 2021 01:27:08 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C343019D7C;
 Thu,  6 May 2021 01:27:05 +0000 (UTC)
Subject: Re: [PATCH 12/22] qapi/parser: add type hint annotations
To: qemu-devel@nongnu.org
References: <20210422030720.3685766-1-jsnow@redhat.com>
 <20210422030720.3685766-13-jsnow@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <052a3711-7784-612b-c74e-dd9c7d0ad248@redhat.com>
Date: Wed, 5 May 2021 21:27:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210422030720.3685766-13-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/21/21 11:07 PM, John Snow wrote:
> +        self.exprs: List[Expression] = []

I did indeed intend to use Expression to mean TopLevelExpr ... However, 
in this case, that's not what actually gets stored here.

I tricked myself!

This stores the dict that associates 'expr', 'doc' and 'info'.

Fixing it to be the generic Dict[str, object] removes the last usage of 
TopLevelExpr from parser.py ... for now.

(pt5c, optional parser cleanups, uses a stronger type for parser's 
return type and sees the reintroduction of that type.)

--js


