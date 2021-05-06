Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42486375668
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 17:19:49 +0200 (CEST)
Received: from localhost ([::1]:34870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lefn2-0006bq-Ai
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 11:19:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lefkT-0004uy-S5
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:17:09 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lefkQ-0006uU-SZ
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:17:09 -0400
Received: by mail-wr1-x42d.google.com with SMTP id v12so6019565wrq.6
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 08:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=TVOGavTbsBrK1FNBiZX1PSZ7uacTt5q9fQ9irXNN7qo=;
 b=VMK3ciFkwRUAGXKuXPV/19PPHyS5Re5OXyZ7GeovQqNWit30iR54jlzGcGqTi1gZB/
 JB538UBQrYgxo69wpg3RVeu8j65wNqKYTWNmzbtKOfE4ryHR1lFxOifNxV9vlDz3Nl/4
 cDLMdxx8z5cc6Ij0DL72VHijAsHkocUNs3hjyyJIUabbTc83grONw9I0rOIN8JXVY0tB
 2tnx2jqvDTr/qGdGBMLGbqG4vDR6Prgqvunszv1fJwjr7123CndZ/+AA53R1HYqrEUJV
 9JyjL0ZGf/iLRw2p5DAd1URrBMVJr6Fafw+WcprIKcEW1AYpCIJ+JdPy/nLS5pC4wNVb
 7xQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=TVOGavTbsBrK1FNBiZX1PSZ7uacTt5q9fQ9irXNN7qo=;
 b=ce030nnwWPJez4IDXPTltf1nbEuDswTCLr6qdaj7ZYceJFpSDeHSRFSizRiB/X7v38
 shR/cXLDg4FGbMslVg4AeivTOlbrDVCvraJBFitIB6ToNlfLbP5x8ge5SnctnKZoXnEh
 I77Mt5Gc5rIk3jTH3eIOvbHW0zjTeyoPFMxZoSgllDrAo6SeGNb1ulp0mZxzr39a850Q
 db0fb+FlQFwdy9ZbwuSsGGmhz08vFoSKl+rv9m3Vxu2jqgxuMhneqvFXfcUdaxnPXI8e
 L496TDdmf0OYUttbvhjSPEt2SHoLLiwYeYAnuJBJqc7FJ5F+rgUOLkaEAUpXYW17f4qn
 E29g==
X-Gm-Message-State: AOAM533hwB+38TyE4N7egHNlcrtx03mhMn8DvRiGc/RX+hwzTpn+f8z8
 RLp4LAvvA7nwqJsbGBCQ+aSpUw==
X-Google-Smtp-Source: ABdhPJwnyIHZOmiu/sI9ExqQFZ5sFse6y+VuqNIaJuO7lTIqP91QrLdDivaCgqoj1PQSkA3JBf6pEg==
X-Received: by 2002:a5d:4d09:: with SMTP id z9mr6087449wrt.131.1620314218652; 
 Thu, 06 May 2021 08:16:58 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w4sm4652376wrl.5.2021.05.06.08.16.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 08:16:56 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 252781FF7E;
 Thu,  6 May 2021 16:16:56 +0100 (BST)
References: <20210505170055.1415360-1-philmd@redhat.com>
 <20210505170055.1415360-4-philmd@redhat.com> <877dkcnk7c.fsf@linaro.org>
 <42044899-6704-7d33-0a73-58fd00adc7ca@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 3/5] gdbstub: Use fixed-size array in GdbCmdParseEntry
 instead of pointer
Date: Thu, 06 May 2021 16:15:38 +0100
In-reply-to: <42044899-6704-7d33-0a73-58fd00adc7ca@redhat.com>
Message-ID: <874kffopsn.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kyle Evans <kevans@freebsd.org>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Warner Losh <imp@bsdimp.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 5/6/21 2:01 PM, Alex Benn=C3=A9e wrote:
>>=20
>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>>=20
>>> GdbCmdParseEntry should have enough room with 20 chars for the command
>>> string, and 8 for the schema. Add the GDB_CMD_PARSE_ENTRY_CMD_SIZE and
>>> GDB_CMD_PARSE_ENTRY_SCHEMA_SIZE definitions.
>>>
>>> Do not use pointer to string of unknown length, but array of fixed
>>> size. Having constant size will help use to remove the alloca() call
>>> in process_string_cmd() in the next commit.
>>=20
>> I don't understand how this helps. The alloca is being used for an array
>> of GdbCmdVariant so why do we want to enlarge the size of the parse
>> table entries?
>
> This patch is crap indeed. I'll post another one with more sense.

Looking at the logic I wonder it's just better turning params into a
GArray and let glib deal with the sizing for us? It's not like one or
two entries breaks the bank on temporary memory allocation.

>
> Sorry about this,
>
> Phil.


--=20
Alex Benn=C3=A9e

