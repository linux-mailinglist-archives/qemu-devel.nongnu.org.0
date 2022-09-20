Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 405BA5BDDA4
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 08:50:25 +0200 (CEST)
Received: from localhost ([::1]:34720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaX5L-0008Px-JD
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 02:50:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oaWzo-0006ff-7n
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 02:44:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oaWzh-0000ql-Px
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 02:44:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663656272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2TW7kn40lQSf0V/2C5l5y5z0PX0gVYwXDTAq9Ks0WDk=;
 b=IMR7UHQYPpUtCtb3tJlXk8/9zbnpUaxFUspFziEts56QYQSLE2rTYBhhkBtGI8LhOK8Vc7
 4RnMsqGQtezg8SQcptC96f2ety+EbPRADXekwDGTVrPCpZ9CzReXUCOz/dEPdaF0fyAI4X
 fldSuWaM0KqlDY0KfRn47z0hmSeDEow=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-428-kQm5CMdIMJK_eSOeQ1x1BQ-1; Tue, 20 Sep 2022 02:44:30 -0400
X-MC-Unique: kQm5CMdIMJK_eSOeQ1x1BQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 r9-20020a1c4409000000b003b3309435a9so331423wma.6
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 23:44:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date;
 bh=2TW7kn40lQSf0V/2C5l5y5z0PX0gVYwXDTAq9Ks0WDk=;
 b=G1YrsypWtgHNwIwA1B6snB7V2z2T/gzgpr1F2obKodL6rYRbvyFDcxV//PySUKRQNS
 0/taiVxp1AFDdvHC33fhokQ4dVzN3GC1AB3XFYTjhUfqw44kLQkt+5AEKBwjC3E8U3Dy
 b/XqzlrlUB/XAPbbIKw5BFpSE5jMkUMixaXFWtYGpOWXtzL3DKfr2+BeftXnUpuohIpY
 x3oyJTTePyBxZGHs9uSpXxjsTcYFzYMzdse2FL4fhGA0qIAJVhaijSB1Tx28YjnNTBM2
 qADUUlv+3EtgUfBiZlVvGWFjJGKCCCGmV7NkTG9UYN67dhxe8dcepLP9JZS3nBr4oRzK
 ve5g==
X-Gm-Message-State: ACrzQf1lxuT8jp/sJYumoJ3OEjkYBUCleHNsxKIDsOsmYKfwJGQdZlT/
 uKYcU/Syymlog1kZSJlWynxhFC91OkhNcHL/DHrV2JmkcA487g48tRL0EKpQNoqkEGmPl9u9W69
 v2Vj/7Tr/zcN8aBs6Av+bBGGK5zle/qQltMcsjh56oQeMAK35YY1WLIo5OQNY95o=
X-Received: by 2002:adf:e806:0:b0:22a:f5c6:6954 with SMTP id
 o6-20020adfe806000000b0022af5c66954mr7772120wrm.539.1663656269540; 
 Mon, 19 Sep 2022 23:44:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4rfZlgJ6vBYo5eseMD8/b9PFeaGsD9qprKiakq0ML1+6IVFpeLISgshjdwCXnxZKmXMwsJuQ==
X-Received: by 2002:adf:e806:0:b0:22a:f5c6:6954 with SMTP id
 o6-20020adfe806000000b0022af5c66954mr7772105wrm.539.1663656269275; 
 Mon, 19 Sep 2022 23:44:29 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-8.web.vodafone.de. [109.43.177.8])
 by smtp.gmail.com with ESMTPSA id
 ba27-20020a0560001c1b00b00228a6ce17b4sm660796wrb.37.2022.09.19.23.44.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Sep 2022 23:44:28 -0700 (PDT)
Message-ID: <b403c8e4-3788-7ba1-a038-3a71fa0bc7c6@redhat.com>
Date: Tue, 20 Sep 2022 08:44:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Brad Smith <brad@comstyle.com>,
 John Snow <jsnow@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: QEMU's FreeBSD 13 CI job is failing
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Seen here for example:

https://gitlab.com/qemu-project/qemu/-/jobs/3050165356#L2543

ld-elf.so.1: /lib/libc.so.7: version FBSD_1.7 required by 
/usr/local/lib/libpython3.9.so.1.0 not found
ERROR: Cannot use '/usr/local/bin/python3', Python >= 3.6 is required.

... looks like the Python binary is not working anymore? Does anybody know 
what happened here?

  Thomas


