Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 293242DC6CF
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 19:59:58 +0100 (CET)
Received: from localhost ([::1]:53158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpc1l-0006Fj-8S
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 13:59:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpbzc-00050v-0j
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 13:57:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpbzR-00065N-3g
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 13:57:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608145051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qaoz6Z7fd0B4b1DHdav3C3gve5wlRMfjUEr8PhLnXos=;
 b=eHPVGsZ1jQEFxpsMuHKKT97ze4DCSb55jmlEWiqnUVg1yPUt57PqJ9BHndusb+UHBijk5+
 f1jUEmzfyDD5OBHvTTpDTw4/pHJK/m0LkkNKUofArI17a+eM8QzSMzKDwfh0FOQ3Uf04jZ
 S/prhMrLmUw1ZTVJydL6PI8OyfDQqHY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-cHoX2kuiMDi099hB94zbxw-1; Wed, 16 Dec 2020 13:57:28 -0500
X-MC-Unique: cHoX2kuiMDi099hB94zbxw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BA0793C
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 18:57:27 +0000 (UTC)
Received: from [10.10.120.103] (ovpn-120-103.rdu2.redhat.com [10.10.120.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD536E715;
 Wed, 16 Dec 2020 18:57:23 +0000 (UTC)
Subject: Re: [PATCH 11/12] qapi/schema: Name the builtin module "" instead of
 None
To: Markus Armbruster <armbru@redhat.com>
References: <20201214235327.1007124-1-jsnow@redhat.com>
 <20201214235327.1007124-12-jsnow@redhat.com>
 <87mtyeqbf2.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <517d53cd-16c6-e15b-b2af-2dfed17935d2@redhat.com>
Date: Wed, 16 Dec 2020 13:57:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <87mtyeqbf2.fsf@dusky.pond.sub.org>
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
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/20 5:42 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> Instead of using None as the built-in module filename, use an empty
>> string instead.
> 
> PATCH 05's changes the module name of the special system module for
> built-in stuff from None to './builtin'.  The other system modules are
> named like './FOO': './init' and './emit' currently.
> 
> This one changes the module *filename* from None to "", and not just for
> the builtin module, but for *all* system modules.  Your commit message
> claims only "the built-in module", which is not true as far as I can
> tell.
> 

Is this true? ... "./init" and "./emit" are defined only in the 
generators, outside of the schema entirely. They don't even have 
"QAPISchemaModule" objects associated with them.

I changed:

         self._make_module(None)  # built-ins 


to

         self._make_module(QAPISourceInfo.builtin().fname)  # built-ins 



that should be precisely only "the" built-in module, shouldn't it? the 
other "system" modules don't even pass through _make_module.

> Should we use the opportunity to make the filename match the module
> name?
> 

If that's something you want to have happen, it can be done, yes.

I had a draft that did it that way initially; I was afraid I was mixing 
up two distinct things: the module fname (schema.py's concept of 
modules) and module name (gen.py's concept of modules). This version of 
my patch kept the two more distinct like they are currently.

We can change "the" built-in module to have an fname of "./builtin" 
which works just fine; gen.py just has to change to not add "./" to 
modules already declared with the leading slash.

Up for debate is if you want the system modules declared in the code 
generators to have to declare 'emit' or './emit'; I left them alone and 
allowed them to say 'event'.

Downside: the ./ prefix takes on special meaning in both gen.py and 
schema.py. the module organization feels decentralized and fragile.

>>                  This allows us to clarify the type of various interfaces
>> dealing with module names as always taking a string, which saves us from
>> having to use Optional[str] everywhere.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>


