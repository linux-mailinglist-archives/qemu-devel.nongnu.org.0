Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5BA4CD27B
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 11:35:49 +0100 (CET)
Received: from localhost ([::1]:54624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ5Ho-0004Mu-Cq
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 05:35:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nQ5Ci-00016R-ND
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:30:34 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:33491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nQ5Cf-0001OK-Sd
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:30:32 -0500
Received: from [192.168.100.1] ([82.142.8.122]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mw9Lu-1oHmJe3WUO-00s6iJ; Fri, 04 Mar 2022 11:30:22 +0100
Message-ID: <43b238c6-3cfb-db0d-735a-c7f391aa67be@vivier.eu>
Date: Fri, 4 Mar 2022 11:30:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 08/10] esp: convert ESPState pdma_cb from a function
 pointer to an integer
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, pbonzini@redhat.com,
 fam@euphon.net, qemu-devel@nongnu.org
References: <20220302212752.6922-1-mark.cave-ayland@ilande.co.uk>
 <20220302212752.6922-9-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220302212752.6922-9-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:emFA7+dix+e2fo0wnwAYV5Gq87BWifyP+U8TZy0Nw17i2UnK4yz
 cU+pZWJPxtbGxK6Ph5U8lGUwWwq/Gr8ypEwWoZx0qYjaRll6v0gKyY0Tb2sosZvmjOB1D7k
 s/o7Y6plxnbPT/J1oUROjiuBOi5ELPYHlWVOuVFfcN+1Elw9gfD+afx0rPWt0vmPhVZHStv
 brVM1AxgtdZs8D+CO1ZdQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VC1OD3Gb4Ow=:+aicVtN5QmoKxJmwSvbdxO
 4GUxi0jDdHhcJ2bmkjHk45aViJ+9nOSYPttVxaflzeIxb65dCSxuMj3N1bW+axXxrCxWk1zvf
 RNPLdhSUXt9SJce7nFWww9+dqiD85sLcV0ifSXfYIcpIB4ErZoWii9PORC3f48gSISLg9+eCx
 fQZLFYPUgHz+oOEfBh9hluHPu6WaYNP5NcQ3yNE35Se2HRv9uKdnNTTM0E7noLPvyYoff/FsZ
 hfNpERuCaofzXMzk0djcTDKzMkHilkMXnZBWAYm8Mnbb+Vi8CGe4nVgtcFKWSXJ1Gq3lGkMnd
 nNsiDWN3n9t9MGcW3wVgm8KMiuMUy5D7Iq0JB3RHgWKPoLKERGLACAFNgEkxJvLrvfaDkayud
 fKmQIg0uByiL9G70Dos5lPTx/KDT52lsPvojafNH9UIY0NhembRvCWAz4sFxjqzAm6jwM8uei
 cdjzV0JmOmm5uZBYxgZBswxcmQz+BL3XvzUpb8QHOrQDhxKh1OvGe7TusEfoLYQnvcMmTleuj
 wbMUp1OH1Bh/p+WSmzzsD3LUxU9kkYLnI5gZRnAwzVNMeTDVKX0DoEi1LeBO0HMhKYXUenm0t
 qNcNvfiASxedlm7NmImPuwJvvssE/dnO+HMDNYrBswWVFVecR0vuRMTA8DGti50olKf8YKs8Q
 Be4s+wr/cEYBtgVW6vkUW9Et7187ovGfde8NZrXdLDYfRWfTtU7ZS4ohBtikldnzk2eE=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 02/03/2022 à 22:27, Mark Cave-Ayland a écrit :
> This prepares for the inclusion of the current PDMA callback in the migration
> stream since the callback is referenced by an integer instead of a function
> pointer.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/scsi/esp.c         | 44 ++++++++++++++++++++++++++++++-------------
>   include/hw/scsi/esp.h | 11 ++++++++++-
>   2 files changed, 41 insertions(+), 14 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>



