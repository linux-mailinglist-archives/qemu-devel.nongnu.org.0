Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57961395868
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 11:47:18 +0200 (CEST)
Received: from localhost ([::1]:39202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lneVx-0007Us-69
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 05:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lneTg-0005rp-QK
 for qemu-devel@nongnu.org; Mon, 31 May 2021 05:44:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lneTd-0002ig-RU
 for qemu-devel@nongnu.org; Mon, 31 May 2021 05:44:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622454292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d7ei2Yef+nrEanID5IIIu3q7Yv5FZ4NajSOONXvN5gM=;
 b=VFEIsBwkm8guGNRqG9PIgy3uA0E3dsDoeuRrocFlBkYWh7/2Nb/ecs5tklnORyEaI5i9/+
 TMkqqxjAlotiXXe3V7uDVK2vyAaUMu6ooGyrSwpkBPYzqyLp/ORR4Kc/zmQ1SrUCW6bVd8
 dD/UrHhmsqLAMMOvT3HpaLktAYgK+Yg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-Cr4CJgDMOiK2VhawOgIXBw-1; Mon, 31 May 2021 05:44:50 -0400
X-MC-Unique: Cr4CJgDMOiK2VhawOgIXBw-1
Received: by mail-wr1-f70.google.com with SMTP id
 x10-20020adfc18a0000b029010d83c83f2aso3763465wre.8
 for <qemu-devel@nongnu.org>; Mon, 31 May 2021 02:44:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d7ei2Yef+nrEanID5IIIu3q7Yv5FZ4NajSOONXvN5gM=;
 b=tcu60DgSKdB2sZHvGfGMD5Qrj567VE/POyn2IyCet2nzTxNiqLwSK4f+6EPIVhOCts
 MR69XUvfdzhU8qYI19wdTMsH+7UTdNkn0BnELHEkM3dVbvnvcS95HtWn6BZE2/ryEI70
 vVw+WpafQezOm8ZjJWDGGMAF6omL3sE76LRaDnIuHsLzP94Xb6yVzTidjwEA+FXpNp86
 UaIae8r82dEmaChBCwg+viZ5TRGgAwNeBYYZq9Cpt43sZht+IoPILsfY0G7+g1AhHzSA
 q7RZ/nPa4OE1LNuAyBB8T7W8ZWDpAT316WbBwaZT3D42iWt+6JPSHYwn9uIJhrZo85Y7
 k9lw==
X-Gm-Message-State: AOAM533D/rw1nTneSe5n41rmkVJOVhSNZNAWLM6jOTZmzZr5kalw2K31
 z0J4SbetvTyf1pl70PPV4X6i4vG5AUyi5NM3cEfbhNPLJgOz8cFHN63E4Qgeg2Ivru4iEDkOFSp
 zZatsQEu/Q+EVJ0I=
X-Received: by 2002:adf:ce01:: with SMTP id p1mr8685329wrn.63.1622454289477;
 Mon, 31 May 2021 02:44:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwC8j8pHReddEYDvypvAVHC+oxdKDrw5YPOsOfVYVqC6dfMMoNHVihIW7OuX95ELzzzG2bVNw==
X-Received: by 2002:adf:ce01:: with SMTP id p1mr8685315wrn.63.1622454289260;
 Mon, 31 May 2021 02:44:49 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id q11sm17365214wrx.80.2021.05.31.02.44.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 02:44:48 -0700 (PDT)
Subject: Re: [PATCH] qobject: Fix maybe uninitialized in qdict_array_split
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
References: <20210518130638.54529-1-frankja@linux.ibm.com>
 <b4aebccf-db62-74da-ebd0-8ca24ea22f59@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <97b11fa8-fd32-9f73-612b-dc4209e5b32e@redhat.com>
Date: Mon, 31 May 2021 11:44:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <b4aebccf-db62-74da-ebd0-8ca24ea22f59@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.618, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, pbonzini@redhat.com,
 cohuck@redhat.com, borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/31/21 11:21 AM, Janosch Frank wrote:
> On 5/18/21 3:06 PM, Janosch Frank wrote:
>> Lets make the compiler happy.
>>
>> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> 
> Ping
> My build is still breaking on Ubuntu because of this.
> 
>> ---
>>  qobject/block-qdict.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/qobject/block-qdict.c b/qobject/block-qdict.c
>> index 1487cc5dd8..b26524429c 100644
>> --- a/qobject/block-qdict.c
>> +++ b/qobject/block-qdict.c
>> @@ -224,7 +224,7 @@ void qdict_array_split(QDict *src, QList **dst)
>>      for (i = 0; i < UINT_MAX; i++) {
>>          QObject *subqobj;
>>          bool is_subqdict;
>> -        QDict *subqdict;
>> +        QDict *subqdict = NULL;
>>          char indexstr[32], prefix[32];
>>          size_t snprintf_ret;

Slightly clearer:

-- >8 --
diff --git a/qobject/block-qdict.c b/qobject/block-qdict.c
index 1487cc5dd8b..8d0f00bc3ce 100644
--- a/qobject/block-qdict.c
+++ b/qobject/block-qdict.c
@@ -224,7 +224,6 @@ void qdict_array_split(QDict *src, QList **dst)
     for (i = 0; i < UINT_MAX; i++) {
         QObject *subqobj;
         bool is_subqdict;
-        QDict *subqdict;
         char indexstr[32], prefix[32];
         size_t snprintf_ret;

@@ -249,14 +248,16 @@ void qdict_array_split(QDict *src, QList **dst)
         }

         if (is_subqdict) {
+            QDict *subqdict = NULL;
+
             qdict_extract_subqdict(src, &subqdict, prefix);
             assert(qdict_size(subqdict) > 0);
+            qlist_append_obj(*dst, QOBJECT(subqdict));
         } else {
             qobject_ref(subqobj);
             qdict_del(src, indexstr);
+            qlist_append_obj(*dst, subqobj);
         }
-
-        qlist_append_obj(*dst, subqobj ?: QOBJECT(subqdict));
     }
 }
---

Anyhow,
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Cc'ing qemu-trivial@


