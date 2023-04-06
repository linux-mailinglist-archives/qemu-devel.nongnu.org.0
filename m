Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8406D9131
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 10:08:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkKew-0000Lx-Hm; Thu, 06 Apr 2023 04:07:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pkKer-0000Lb-Ta
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 04:07:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pkKeq-0003hh-5T
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 04:07:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680768467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M3QOwMCglVKmUSpe3UpnHZy8GKlB6kDkbGKOAU8ZVbs=;
 b=LTQ/2UH0S+KyhQds1quaHfCEem2iVPuCjIMfU8PZ+rj8b02yU3pWlDDlP6dN7lv68XoS67
 GavVIK3I8OXVCXWcl7d4VbZLt3l83TTTbwZ2NbUtzCAJBkY4pne8EUB2xUWEFRKlM05fWk
 tcDMK902UBqkWwat0PttUROEA0nLJrw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-601-aUuG8gSTObC_o4N7PkjSag-1; Thu, 06 Apr 2023 04:07:45 -0400
X-MC-Unique: aUuG8gSTObC_o4N7PkjSag-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 61C24800B23;
 Thu,  6 Apr 2023 08:07:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 382C62166B26;
 Thu,  6 Apr 2023 08:07:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 92BFF21E6926; Thu,  6 Apr 2023 10:07:42 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Antonio Apostoliu" <antonio.apostoliu@cestrin.ro>
Cc: <qemu-devel@nongnu.org>
Subject: Re: Please help me with with one information
References: <000001d96849$fb7d3b50$f277b1f0$@cestrin.ro>
Date: Thu, 06 Apr 2023 10:07:42 +0200
In-Reply-To: <000001d96849$fb7d3b50$f277b1f0$@cestrin.ro> (Antonio Apostoliu's
 message of "Thu, 6 Apr 2023 08:38:14 +0300")
Message-ID: <87ile9ph69.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

"Antonio Apostoliu" <antonio.apostoliu@cestrin.ro> writes:

> Hello 
>
>  
>
> You are so kind to tell me how can I use qmp to send colon character . I
> speak about this character   :
>
>  
>
> I tried:
>
> {"execute":"send-key","arguments":{"keys":[{"type":"qcode","data":"shift-sem
> icolon"}]}}

Reply:

  {"error": {"class": "GenericError", "desc": "Parameter 'data' does not accept value 'shift-semicolon'"}}

There is no key code "shift-semicolon".

The "QEMU QMP Reference Manual" lists the key codes:
https://qemu.readthedocs.io/en/latest/interop/qemu-qmp-ref.html#qapidoc-1729

> {"execute":"send-key","arguments":{"keys":[{"type":"qcode","data":"shift","d
> ata":"semicolon"}]}}

Reply:

    {"error": {"class": "GenericError", "desc": "JSON parse error, duplicate key"}}

Repeated keys don't make lists, lists do:

    {"execute": "send-key",
     "arguments": {"keys": [
         {"type": "qcode","data": "shift"},
         {"type": "qcode","data": "semicolon"}]}}

> Both don't sent the character in my case

Next time, include the replies you observe in your question.

> All others character worked
>
>  
>
> Best regards


