Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E988736C4F1
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 13:18:21 +0200 (CEST)
Received: from localhost ([::1]:39288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbLjR-0003zk-1i
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 07:18:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lbLdz-0000LM-Op
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 07:12:47 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:57289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lbLdt-0006dy-Oa
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 07:12:42 -0400
Received: from [192.168.100.1] ([82.142.25.254]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MmkjY-1l98MB1EYw-00jqmv; Tue, 27 Apr 2021 13:12:33 +0200
Subject: Re: [Bug 1926246] Re: chrome based apps can not be run under qemu
 user mode
To: Bug 1926246 <1926246@bugs.launchpad.net>, qemu-devel@nongnu.org
References: <161950107824.17271.5936509317690090363.malonedeb@chaenomeles.canonical.com>
 <161952108358.12222.10422963550242509957.malone@wampee.canonical.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <c7f9dc51-3f95-de6f-26e0-681c92683900@vivier.eu>
Date: Tue, 27 Apr 2021 13:12:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <161952108358.12222.10422963550242509957.malone@wampee.canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:JbBGlLMzjql5AeVDYkQWT2yANpgMTmjX8RtwBXugu2E9Uuhmqet
 ZL7hD+uKbzPYKtDOK37n79FoF0994I8ec+K+jrhorb0htBHAgCsaXPMQQXLwEDV1C34+M1C
 1f9OePXBRnqmvdatHXE9ois5suHjIyoYwNGmBXd/ibtd4NqKqsOeZZgSuIaltGVux2PA7E7
 mZCJmn24SJMo/z713pdaw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VQIucw1Zu0Q=:y4ITZl4rzvo7jWL7xgTbPW
 XUVX3RJL/CauPrKjrU8Gz3EarWRnMwnU8y+hF0NW+ZM1sQPWPi3oU30dHkv0JrVv3v60vRwmJ
 SQAxwMlrSuYgifvgKjlBIqMJWnafZHUc/tBLOVR2A6IHqg0Y2oYAu91rd1G6iO5TY8KdeMT82
 0S+/G1OCxskbJVRATeOmlI55/xz4xXUblEwQyd6QHnv+20+42eo6kYhkc6WwJcj/ozDnCNv3G
 ImPPDPOztVMNDTVtd+LpyFQkSLUCFhwbcTENI9xUfDlH8Ji6f0Cyly4UuJqT5b+VNrR5Nt5Fi
 eGWBaKyOzDenZ51u82HVz92m6/l4O5LTMN14RNUChsKLOk5ay0jjTM+GC3wNm+Fv4TnSIqP6H
 Wc1SV/kybocnFS/at342HVrsf1/spkNbxlBNW/SX3neb6bMjL6oEtUfNkCTDh8ia0OCIwx+Zo
 LODb1ilSoDYL5+UGUOO0TpaTb381Un2BR4/l8N/fgUME8iwcgnnhLJU7InXbfYbLKgrOaETKc
 praKwTgOpUDh3BmZOMI4fA=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 27/04/2021 à 12:58, Wind Li a écrit :
> Just found there's already a patch for this:
> https://lists.sr.ht/~philmd/qemu/patches/8196
> 

Yes, you are right.

I didn't see this patch because he didn't cc: me and he removed the "linux-user" tag from the subject...

Could you verify it actually fixes the problem?

