Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CABFD340BEF
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 18:34:56 +0100 (CET)
Received: from localhost ([::1]:54608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMwXv-0005eY-S4
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 13:34:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lMwHS-00086o-Hi; Thu, 18 Mar 2021 13:17:58 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:52863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lMwHM-0003UU-LK; Thu, 18 Mar 2021 13:17:51 -0400
Received: by mail-wm1-x32c.google.com with SMTP id d191so4037084wmd.2;
 Thu, 18 Mar 2021 10:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
 b=lrS7Aw5DtJd9sevZH8Huf1a0LQjcDF4Jk2pWO2cbdFmZujJVhEpVq5mpQyoYdrXgzX
 D13gwXZNFVljl4dUDJhj+dwjqBS1I9hfarZi75c49aovSxntQtsJAQI4I3gy37hRf/mL
 P1lbsRPnCbYFYxTDfdUAc1zysJYWJpgKOILs1ldGKuMe/weyU8qR8bqA/UAe0jxg1pjQ
 JF+9GPRylX0vBC1bdzpUsY8aRoBkFJekYhGT1sUt0lkRsp0GW05X3mKdri71W5pjolP4
 KvZ1BqSm8bObP+75Hb8BThbM+ZhnXwad6y+jLQICl8VcC8fY5uO7TXPm729VPCxRKGg6
 ityQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:to:from:subject:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
 b=uMUeNfb6LAXWwSjxssuSCDtDJWrS1kJDUtK2Moro265V5piKX0fz5EWXO4bLAJkdGn
 Z964vKQi2bF32vSGZWdTKa8kZCJ6+ItwAhyRSeIDcWVxBYt0ApnvOnOF8wPR8JZN1hAu
 +zLFj9pPo1VpZAuptpTgob5T7jUr6amAPMxeFeFxgRgY8OTwx77LZbTYv8WV19V9N7Gp
 iG49HjrcFm97XQWHRWXN0eyQAjh8l43AcPmSFanDnxETlHzwuk5XU0ZmHXZEjKo2Fpyo
 GLTVYykSlGRPj+l9iAySZCcRuqSQ96lS+mAahB30vCHNmJROP3ZC9xyEiFES1mDRcn+r
 iEmA==
X-Gm-Message-State: AOAM5325xHdbq+dKf8ZUoswU8kOFvIaJEPbF8C0mp56pxeB0Hq3PfviQ
 KoUS5NyyftjRyOJOrNFLoBHCBZWUqIE=
X-Google-Smtp-Source: ABdhPJwvRvbeLBpg4BEunV+ewmxUrgDpClPnQmnZVBKCPvAKCHyV9ztqHjT0n9VCkzbNDVsLburX8A==
X-Received: by 2002:a7b:c409:: with SMTP id k9mr169766wmi.151.1616087866769;
 Thu, 18 Mar 2021 10:17:46 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id 1sm7274268wmj.0.2021.03.18.10.17.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 10:17:46 -0700 (PDT)
To: qemu-devel <qemu-devel@nongnu.org>
From: Paolo Bonzini <bonzini@gnu.org>
Subject: [not a patch] sorry folks this is the last test
Message-ID: <48b9c36d-5c89-aec8-a258-44990c2eeeb3@gnu.org>
Date: Thu, 18 Mar 2021 18:17:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: 29
X-Spam_score: 2.9
X-Spam_bar: ++
X-Spam_report: (2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_TONAME_EQ_TOLOCAL_SHORT=1.999,
 PDS_TONAME_EQ_TOLOCAL_VSHORT=0.999, PYZOR_CHECK=1.392,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


